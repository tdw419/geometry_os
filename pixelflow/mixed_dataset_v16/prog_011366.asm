; DESCRIPTION: Composite: Places a green dot at position (113, 105) then Renders a black line between points (179, 30) and (304, 84).
; PLAN: r0=113(x), r1=105(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=179(x1), r6=30(y1), r7=304(x2), r8=84(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 113
LDI r1, 105
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 179
LDI r6, 30
LDI r7, 304
LDI r8, 84
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
