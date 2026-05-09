; DESCRIPTION: Places a black line segment connecting (408, 222) to (488, 191).
; PLAN: r0=408(x1), r1=222(y1), r2=488(x2), r3=191(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 222
LDI r2, 488
LDI r3, 191
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
