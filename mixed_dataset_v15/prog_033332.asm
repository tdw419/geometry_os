; DESCRIPTION: Composite: Places a red line segment connecting (298, 19) to (134, 166) then Sets a single orange pixel at (255, 126).
; PLAN: r0=298(x1), r1=19(y1), r2=134(x2), r3=166(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=255(x), r6=126(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 298
LDI r1, 19
LDI r2, 134
LDI r3, 166
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 126
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
