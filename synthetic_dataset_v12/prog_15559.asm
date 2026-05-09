; DESCRIPTION: Composite: Places a purple dot at position (98, 217) then Places a blue line segment connecting (28, 64) to (406, 245).
; PLAN: r0=98(x), r1=217(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=28(x1), r6=64(y1), r7=406(x2), r8=245(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 98
LDI r1, 217
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 28
LDI r6, 64
LDI r7, 406
LDI r8, 245
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
