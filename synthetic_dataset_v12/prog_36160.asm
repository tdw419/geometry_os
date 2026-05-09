; DESCRIPTION: Places a black line segment connecting (488, 247) to (164, 164).
; PLAN: r0=488(x1), r1=247(y1), r2=164(x2), r3=164(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 247
LDI r2, 164
LDI r3, 164
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
