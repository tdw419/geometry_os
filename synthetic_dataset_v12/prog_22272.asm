; DESCRIPTION: Renders a green line between points (321, 207) and (356, 69).
; PLAN: r0=321(x1), r1=207(y1), r2=356(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 207
LDI r2, 356
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
