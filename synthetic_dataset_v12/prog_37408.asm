; DESCRIPTION: Draws a black line from (152, 120) to (402, 152).
; PLAN: r0=152(x1), r1=120(y1), r2=402(x2), r3=152(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 120
LDI r2, 402
LDI r3, 152
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
