; DESCRIPTION: Composite: Places a yellow dot at position (484, 81) then Draws a orange line from (368, 94) to (357, 231) then Places a white 84x12 rectangle at position (323, 32).
; PLAN: r0=484(x), r1=81(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=368(x1), r6=94(y1), r7=357(x2), r8=231(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=323(x), r11=32(y), r12=84(width), r13=12(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 484
LDI r1, 81
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 368
LDI r6, 94
LDI r7, 357
LDI r8, 231
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 323
LDI r11, 32
LDI r12, 84
LDI r13, 12
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
