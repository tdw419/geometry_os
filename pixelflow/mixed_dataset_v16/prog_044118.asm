; DESCRIPTION: Draws a yellow line from (325, 179) to (488, 179).
; PLAN: r0=325(x1), r1=179(y1), r2=488(x2), r3=179(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 179
LDI r2, 488
LDI r3, 179
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
