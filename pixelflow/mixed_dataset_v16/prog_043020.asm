; DESCRIPTION: Draws a yellow line from (48, 69) to (488, 129).
; PLAN: r0=48(x1), r1=69(y1), r2=488(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 69
LDI r2, 488
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
