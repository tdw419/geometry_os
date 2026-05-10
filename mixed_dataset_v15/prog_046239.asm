; DESCRIPTION: Composite: Draws a cyan line from (499, 143) to (285, 252) then Renders a cyan box of size 29x12 starting at (435, 16) then Sets a single blue pixel at (260, 107).
; PLAN: r0=499(x1), r1=143(y1), r2=285(x2), r3=252(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=435(x), r6=16(y), r7=29(width), r8=12(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=260(x), r11=107(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 499
LDI r1, 143
LDI r2, 285
LDI r3, 252
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 16
LDI r7, 29
LDI r8, 12
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 260
LDI r11, 107
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
