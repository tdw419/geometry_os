; DESCRIPTION: Draws a black line from (282, 175) to (264, 152).
; PLAN: r0=282(x1), r1=175(y1), r2=264(x2), r3=152(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 175
LDI r2, 264
LDI r3, 152
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
