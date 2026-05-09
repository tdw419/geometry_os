; DESCRIPTION: Composite: Sets a single red pixel at (489, 34) then Places a green circle of radius 29 at center (301, 37).
; PLAN: r0=489(x), r1=34(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=301(x), r6=37(y), r7=29(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 489
LDI r1, 34
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 301
LDI r6, 37
LDI r7, 29
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
