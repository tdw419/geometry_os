; DESCRIPTION: Renders a black line between points (196, 69) and (148, 195).
; PLAN: r0=196(x1), r1=69(y1), r2=148(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 69
LDI r2, 148
LDI r3, 195
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
