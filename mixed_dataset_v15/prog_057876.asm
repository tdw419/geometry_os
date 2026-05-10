; DESCRIPTION: Draws a green line from (69, 10) to (496, 253).
; PLAN: r0=69(x1), r1=10(y1), r2=496(x2), r3=253(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 10
LDI r2, 496
LDI r3, 253
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
