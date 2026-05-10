; DESCRIPTION: Renders a white line between points (20, 216) and (488, 82).
; PLAN: r0=20(x1), r1=216(y1), r2=488(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 216
LDI r2, 488
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
