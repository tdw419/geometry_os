; DESCRIPTION: Renders a purple line between points (166, 73) and (111, 226).
; PLAN: r0=166(x1), r1=73(y1), r2=111(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 73
LDI r2, 111
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
