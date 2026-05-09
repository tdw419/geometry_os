; DESCRIPTION: Draws a blue line from (53, 1) to (346, 51).
; PLAN: r0=53(x1), r1=1(y1), r2=346(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 1
LDI r2, 346
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
