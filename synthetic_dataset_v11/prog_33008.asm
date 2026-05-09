; DESCRIPTION: Draws a black line from (69, 119) to (16, 6).
; PLAN: r0=69(x1), r1=119(y1), r2=16(x2), r3=6(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 119
LDI r2, 16
LDI r3, 6
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
