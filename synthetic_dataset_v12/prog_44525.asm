; DESCRIPTION: Draws a black line from (103, 15) to (278, 161).
; PLAN: r0=103(x1), r1=15(y1), r2=278(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 15
LDI r2, 278
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
