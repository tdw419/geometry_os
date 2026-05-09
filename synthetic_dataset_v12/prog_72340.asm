; DESCRIPTION: Composite: Renders a blue box of size 19x41 starting at (252, 46) then Draws a orange line from (313, 192) to (507, 240).
; PLAN: r0=252(x), r1=46(y), r2=19(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=313(x1), r6=192(y1), r7=507(x2), r8=240(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 252
LDI r1, 46
LDI r2, 19
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 192
LDI r7, 507
LDI r8, 240
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
