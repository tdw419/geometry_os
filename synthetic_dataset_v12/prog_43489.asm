; DESCRIPTION: Draws a black line from (260, 166) to (442, 155).
; PLAN: r0=260(x1), r1=166(y1), r2=442(x2), r3=155(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 166
LDI r2, 442
LDI r3, 155
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
