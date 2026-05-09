; DESCRIPTION: Draws a black line from (7, 122) to (215, 115).
; PLAN: r0=7(x1), r1=122(y1), r2=215(x2), r3=115(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 122
LDI r2, 215
LDI r3, 115
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
