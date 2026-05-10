; DESCRIPTION: Renders a white line between points (392, 106) and (488, 7).
; PLAN: r0=392(x1), r1=106(y1), r2=488(x2), r3=7(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 106
LDI r2, 488
LDI r3, 7
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
