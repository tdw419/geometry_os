; DESCRIPTION: Composite: Places a orange circle of radius 25 at center (170, 175) then Places a cyan line segment connecting (23, 111) to (311, 199).
; PLAN: r0=170(x), r1=175(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=23(x1), r6=111(y1), r7=311(x2), r8=199(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 170
LDI r1, 175
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 23
LDI r6, 111
LDI r7, 311
LDI r8, 199
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
