; DESCRIPTION: Composite: Places a red dot at position (78, 85) then Renders a blue line between points (74, 58) and (42, 114).
; PLAN: r0=78(x), r1=85(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=74(x1), r6=58(y1), r7=42(x2), r8=114(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 78
LDI r1, 85
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 74
LDI r6, 58
LDI r7, 42
LDI r8, 114
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
