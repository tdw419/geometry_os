; DESCRIPTION: Renders a blue line between points (176, 28) and (361, 95).
; PLAN: r0=176(x1), r1=28(y1), r2=361(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 28
LDI r2, 361
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
