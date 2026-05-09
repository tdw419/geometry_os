; DESCRIPTION: Composite: Sets a single green pixel at (23, 49) then Renders a black line between points (61, 33) and (206, 58).
; PLAN: r0=23(x), r1=49(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=61(x1), r6=33(y1), r7=206(x2), r8=58(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 23
LDI r1, 49
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 61
LDI r6, 33
LDI r7, 206
LDI r8, 58
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
