; DESCRIPTION: Draws a black line from (379, 45) to (65, 210).
; PLAN: r0=379(x1), r1=45(y1), r2=65(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 45
LDI r2, 65
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
