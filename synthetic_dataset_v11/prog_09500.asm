; DESCRIPTION: Draws a black line from (215, 22) to (87, 58).
; PLAN: r0=215(x1), r1=22(y1), r2=87(x2), r3=58(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 22
LDI r2, 87
LDI r3, 58
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
