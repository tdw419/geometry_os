; DESCRIPTION: Renders a blue line between points (30, 4) and (150, 95).
; PLAN: r0=30(x1), r1=4(y1), r2=150(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 4
LDI r2, 150
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
