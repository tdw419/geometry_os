; DESCRIPTION: Composite: Places a green line segment connecting (41, 181) to (446, 238) then Draws a green rectangle at (46, 6) with width 115 and height 69.
; PLAN: r0=41(x1), r1=181(y1), r2=446(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=46(x), r6=6(y), r7=115(width), r8=69(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 41
LDI r1, 181
LDI r2, 446
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 46
LDI r6, 6
LDI r7, 115
LDI r8, 69
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
