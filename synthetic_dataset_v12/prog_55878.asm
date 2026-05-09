; DESCRIPTION: Renders a blue line between points (488, 47) and (79, 104).
; PLAN: r0=488(x1), r1=47(y1), r2=79(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 47
LDI r2, 79
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
