; DESCRIPTION: Composite: Places a magenta dot at position (511, 74) then Renders a purple line between points (192, 129) and (377, 157).
; PLAN: r0=511(x), r1=74(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=192(x1), r6=129(y1), r7=377(x2), r8=157(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 511
LDI r1, 74
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 192
LDI r6, 129
LDI r7, 377
LDI r8, 157
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
