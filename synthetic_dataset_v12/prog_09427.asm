; DESCRIPTION: Draws a black line from (442, 207) to (100, 253).
; PLAN: r0=442(x1), r1=207(y1), r2=100(x2), r3=253(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 207
LDI r2, 100
LDI r3, 253
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
