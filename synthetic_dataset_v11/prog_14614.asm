; DESCRIPTION: Renders a black line between points (84, 107) and (30, 69).
; PLAN: r0=84(x1), r1=107(y1), r2=30(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 107
LDI r2, 30
LDI r3, 69
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
