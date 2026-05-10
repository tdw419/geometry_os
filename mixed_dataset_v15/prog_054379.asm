; DESCRIPTION: Composite: Draws a blue rectangle at (252, 238) with width 113 and height 16 then Places a magenta line segment connecting (282, 139) to (453, 98) then Places a yellow dot at position (211, 216).
; PLAN: r0=252(x), r1=238(y), r2=113(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=282(x1), r6=139(y1), r7=453(x2), r8=98(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=211(x), r11=216(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 252
LDI r1, 238
LDI r2, 113
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 139
LDI r7, 453
LDI r8, 98
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 211
LDI r11, 216
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
