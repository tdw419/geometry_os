; DESCRIPTION: Renders a green line between points (213, 153) and (87, 69).
; PLAN: r0=213(x1), r1=153(y1), r2=87(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 153
LDI r2, 87
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
