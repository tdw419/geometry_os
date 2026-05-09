; DESCRIPTION: Composite: Renders a blue box of size 41x83 starting at (359, 131) then Places a cyan line segment connecting (275, 146) to (471, 175).
; PLAN: r0=359(x), r1=131(y), r2=41(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x1), r6=146(y1), r7=471(x2), r8=175(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 359
LDI r1, 131
LDI r2, 41
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 146
LDI r7, 471
LDI r8, 175
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
