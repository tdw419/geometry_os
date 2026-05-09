; DESCRIPTION: Renders a purple line between points (90, 50) and (246, 27).
; PLAN: r0=90(x1), r1=50(y1), r2=246(x2), r3=27(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 50
LDI r2, 246
LDI r3, 27
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
