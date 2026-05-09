; DESCRIPTION: Composite: Sets a single white pixel at (360, 253) then Renders a black line between points (307, 97) and (3, 119).
; PLAN: r0=360(x), r1=253(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=307(x1), r6=97(y1), r7=3(x2), r8=119(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 360
LDI r1, 253
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 307
LDI r6, 97
LDI r7, 3
LDI r8, 119
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
