; DESCRIPTION: Composite: Places a green circle of radius 30 at center (445, 213) then Draws a white line from (419, 188) to (218, 59) then Places a cyan 32x26 rectangle at position (336, 44).
; PLAN: r0=445(x), r1=213(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=419(x1), r6=188(y1), r7=218(x2), r8=59(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=336(x), r11=44(y), r12=32(width), r13=26(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 445
LDI r1, 213
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 419
LDI r6, 188
LDI r7, 218
LDI r8, 59
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 336
LDI r11, 44
LDI r12, 32
LDI r13, 26
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
