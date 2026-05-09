; DESCRIPTION: Renders a purple line between points (246, 61) and (126, 134).
; PLAN: r0=246(x1), r1=61(y1), r2=126(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 61
LDI r2, 126
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
