; DESCRIPTION: Renders a green line between points (237, 69) and (313, 184).
; PLAN: r0=237(x1), r1=69(y1), r2=313(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 69
LDI r2, 313
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
