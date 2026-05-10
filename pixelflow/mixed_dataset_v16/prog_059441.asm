; DESCRIPTION: Draws a green line from (69, 31) to (148, 216).
; PLAN: r0=69(x1), r1=31(y1), r2=148(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 31
LDI r2, 148
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
