; DESCRIPTION: Draws a black line from (69, 63) to (183, 109).
; PLAN: r0=69(x1), r1=63(y1), r2=183(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 63
LDI r2, 183
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
