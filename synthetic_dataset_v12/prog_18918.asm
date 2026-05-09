; DESCRIPTION: Places a yellow line segment connecting (462, 36) to (488, 250).
; PLAN: r0=462(x1), r1=36(y1), r2=488(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 36
LDI r2, 488
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
