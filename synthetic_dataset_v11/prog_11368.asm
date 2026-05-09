; DESCRIPTION: Renders a green line between points (177, 9) and (148, 69).
; PLAN: r0=177(x1), r1=9(y1), r2=148(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 9
LDI r2, 148
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
