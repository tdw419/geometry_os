; DESCRIPTION: Composite: Draws a orange rectangle at (242, 177) with width 108 and height 40 then Renders a blue line between points (313, 232) and (287, 235).
; PLAN: r0=242(x), r1=177(y), r2=108(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=313(x1), r6=232(y1), r7=287(x2), r8=235(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 242
LDI r1, 177
LDI r2, 108
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 232
LDI r7, 287
LDI r8, 235
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
