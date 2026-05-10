; DESCRIPTION: Composite: Sets a single magenta pixel at (264, 53) then Renders a green line between points (88, 172) and (412, 3).
; PLAN: r0=264(x), r1=53(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=88(x1), r6=172(y1), r7=412(x2), r8=3(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 264
LDI r1, 53
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 88
LDI r6, 172
LDI r7, 412
LDI r8, 3
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
