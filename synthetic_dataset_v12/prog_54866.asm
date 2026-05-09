; DESCRIPTION: Draws a black line from (69, 84) to (270, 174).
; PLAN: r0=69(x1), r1=84(y1), r2=270(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 84
LDI r2, 270
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
