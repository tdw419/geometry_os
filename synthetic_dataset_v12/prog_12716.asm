; DESCRIPTION: Composite: Places a green dot at position (159, 63) then Places a white 76x60 rectangle at position (220, 121) then Draws a orange line from (393, 170) to (144, 1).
; PLAN: r0=159(x), r1=63(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=220(x), r6=121(y), r7=76(width), r8=60(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=393(x1), r11=170(y1), r12=144(x2), r13=1(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 159
LDI r1, 63
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 220
LDI r6, 121
LDI r7, 76
LDI r8, 60
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 393
LDI r11, 170
LDI r12, 144
LDI r13, 1
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
