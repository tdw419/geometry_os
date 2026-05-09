; DESCRIPTION: Composite: Places a purple dot at position (20, 91) then Places a red circle of radius 34 at center (433, 84).
; PLAN: r0=20(x), r1=91(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=433(x), r6=84(y), r7=34(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 20
LDI r1, 91
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 433
LDI r6, 84
LDI r7, 34
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
