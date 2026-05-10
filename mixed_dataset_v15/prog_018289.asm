; DESCRIPTION: Composite: Places a orange line segment connecting (314, 75) to (271, 170) then Places a cyan dot at position (410, 212).
; PLAN: r0=314(x1), r1=75(y1), r2=271(x2), r3=170(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=410(x), r6=212(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 314
LDI r1, 75
LDI r2, 271
LDI r3, 170
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 212
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
