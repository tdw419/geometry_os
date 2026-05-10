; DESCRIPTION: Draws a green line from (286, 2) to (271, 148).
; PLAN: r0=286(x1), r1=2(y1), r2=271(x2), r3=148(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 2
LDI r2, 271
LDI r3, 148
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
