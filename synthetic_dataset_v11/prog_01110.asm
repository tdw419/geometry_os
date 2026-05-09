; DESCRIPTION: Places a black line segment connecting (238, 135) to (217, 107).
; PLAN: r0=238(x1), r1=135(y1), r2=217(x2), r3=107(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 135
LDI r2, 217
LDI r3, 107
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
