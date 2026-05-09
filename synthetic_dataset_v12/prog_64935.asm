; DESCRIPTION: Places a blue line segment connecting (456, 120) to (488, 129).
; PLAN: r0=456(x1), r1=120(y1), r2=488(x2), r3=129(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 120
LDI r2, 488
LDI r3, 129
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
