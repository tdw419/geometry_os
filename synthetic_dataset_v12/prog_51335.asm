; DESCRIPTION: Composite: Places a cyan line segment connecting (38, 78) to (77, 158) then Places a cyan circle of radius 41 at center (433, 205).
; PLAN: r0=38(x1), r1=78(y1), r2=77(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=433(x), r6=205(y), r7=41(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 38
LDI r1, 78
LDI r2, 77
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 205
LDI r7, 41
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
