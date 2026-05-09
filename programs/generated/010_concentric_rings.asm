; Concentric rings starting from center, cycling through rainbow colors
; Each ring has a different hue, stepping through the spectrum

LDI r0, 128        ; r0 = center x
LDI r1, 128        ; r1 = center y
LDI r2, 5          ; r2 = starting radius
LDI r6, 20         ; r6 = ring count
LDI r10, 20        ; r10 = radius step

loop:
  ; Compute color: use radius as hue index
  ; Cycle through red -> yellow -> green -> cyan -> blue -> magenta
  LDI r7, 0
  ADD r7, r2       ; r7 = current radius as color seed

  ; Simple hue: map radius into RGB channels
  ; Phase = (radius * 6) % 256 to get 0-5 color phase
  LDI r3, 6
  MUL r3, r7       ; r3 = radius * 6
  LDI r4, 0xFF
  AND r3, r4       ; r3 = phase (0-255)

  ; Divide phase by ~43 to get sector (0-5) using repeated subtract
  ; sector = phase / 43
  LDI r5, 0        ; r5 = sector counter
  LDI r8, 43
sector_loop:
  SUB r3, r8
  JZ r3, sector_done
  LDI r9, 0
  ADD r9, r3
  LDI r4, 0
  SUB r9, r4       ; check if r3 went negative... tricky without flags

  ; Use a simpler approach: just AND with 0xE0 to get rough sector
  ; Actually let me use a much simpler color cycling
  JMP color_done

sector_done:
  ADD r5, r8

color_done:
  ; Simple approach: color = radius shifted into different channels
  LDI r4, 0
  ADD r4, r2       ; r4 = radius value
  LDI r5, 0xFF
  AND r4, r5       ; r4 = radius & 0xFF (0-255)

  ; Red component = radius * 3 & 0xFF
  LDI r7, 3
  MUL r7, r4       ; r7 = radius*3 mod 65536
  LDI r5, 0xFF
  AND r7, r5       ; r7 = red component

  ; Green component = radius * 7 & 0xFF
  LDI r8, 7
  MUL r8, r4
  AND r8, r5       ; r8 = green component

  ; Blue component = radius * 11 & 0xFF
  LDI r9, 11
  MUL r9, r4
  AND r9, r5       ; r9 = blue component

  ; Combine: color = (red << 16) | (green << 8) | blue
  LDI r3, 0
  ADD r3, r7       ; start with red

  ; Shift red left 16: multiply by 0x10000
  LDI r12, 0x100
  MUL r3, r12      ; r3 = red << 8
  MUL r3, r12      ; r3 = red << 16

  ; Shift green left 8: multiply by 0x100
  LDI r13, 0
  ADD r13, r8
  MUL r13, r12     ; r13 = green << 8

  ; Combine
  OR r3, r13       ; r3 = (red << 16) | (green << 8)
  OR r3, r9        ; r3 = full RGB color

  ; Draw the circle
  CIRCLE r0, r1, r2, r3

  ; Advance radius
  LDI r11, 0
  ADD r11, r10
  ADD r2, r11      ; radius += 20

  ; Decrement counter
  LDI r11, 1
  SUB r6, r11
  JNZ r6, loop

HALT
