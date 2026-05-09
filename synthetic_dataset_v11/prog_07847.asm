; DESCRIPTION: Renders a purple line between points (45, 221) and (67, 128).
; PLAN: r0=45(x1), r1=221(y1), r2=67(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 221
LDI r2, 67
LDI r3, 128
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
