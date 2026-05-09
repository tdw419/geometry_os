; DESCRIPTION: Renders a blue line between points (100, 64) and (458, 95).
; PLAN: r0=100(x1), r1=64(y1), r2=458(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 64
LDI r2, 458
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
