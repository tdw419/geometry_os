; DESCRIPTION: Renders a green line between points (22, 249) and (69, 55).
; PLAN: r0=22(x1), r1=249(y1), r2=69(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 249
LDI r2, 69
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
