; DESCRIPTION: Renders a purple line between points (156, 86) and (401, 95).
; PLAN: r0=156(x1), r1=86(y1), r2=401(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 86
LDI r2, 401
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
