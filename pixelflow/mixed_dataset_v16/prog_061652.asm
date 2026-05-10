; DESCRIPTION: Composite: Places a red dot at position (220, 81) then Renders a blue line between points (322, 61) and (136, 28).
; PLAN: r0=220(x), r1=81(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=322(x1), r6=61(y1), r7=136(x2), r8=28(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 220
LDI r1, 81
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 322
LDI r6, 61
LDI r7, 136
LDI r8, 28
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
