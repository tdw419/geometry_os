; DESCRIPTION: Renders a purple line between points (119, 160) and (42, 173).
; PLAN: r0=119(x1), r1=160(y1), r2=42(x2), r3=173(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 160
LDI r2, 42
LDI r3, 173
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
