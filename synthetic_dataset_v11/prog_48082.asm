; DESCRIPTION: Renders a purple line between points (82, 2) and (16, 132).
; PLAN: r0=82(x1), r1=2(y1), r2=16(x2), r3=132(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 2
LDI r2, 16
LDI r3, 132
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
