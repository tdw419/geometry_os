; DESCRIPTION: Composite: Places a green dot at position (310, 78) then Renders a orange line between points (115, 255) and (463, 236) then Places a blue 95x22 rectangle at position (282, 139).
; PLAN: r0=310(x), r1=78(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=115(x1), r6=255(y1), r7=463(x2), r8=236(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=282(x), r11=139(y), r12=95(width), r13=22(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 310
LDI r1, 78
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 115
LDI r6, 255
LDI r7, 463
LDI r8, 236
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 282
LDI r11, 139
LDI r12, 95
LDI r13, 22
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
