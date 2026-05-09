; DESCRIPTION: Composite: Draws a cyan line from (70, 170) to (474, 7) then Sets a single purple pixel at (111, 91).
; PLAN: r0=70(x1), r1=170(y1), r2=474(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=111(x), r6=91(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 70
LDI r1, 170
LDI r2, 474
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 91
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
