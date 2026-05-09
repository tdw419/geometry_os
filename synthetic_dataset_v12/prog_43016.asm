; DESCRIPTION: Draws a black line from (236, 78) to (346, 238).
; PLAN: r0=236(x1), r1=78(y1), r2=346(x2), r3=238(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 78
LDI r2, 346
LDI r3, 238
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
