; DESCRIPTION: Draws a white line from (36, 21) to (488, 185).
; PLAN: r0=36(x1), r1=21(y1), r2=488(x2), r3=185(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 21
LDI r2, 488
LDI r3, 185
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
