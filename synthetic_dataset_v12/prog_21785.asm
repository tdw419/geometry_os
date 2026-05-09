; DESCRIPTION: Renders a purple line between points (30, 39) and (329, 168).
; PLAN: r0=30(x1), r1=39(y1), r2=329(x2), r3=168(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 39
LDI r2, 329
LDI r3, 168
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
