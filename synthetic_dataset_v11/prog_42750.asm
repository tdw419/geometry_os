; DESCRIPTION: Renders a green line between points (69, 60) and (58, 161).
; PLAN: r0=69(x1), r1=60(y1), r2=58(x2), r3=161(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 60
LDI r2, 58
LDI r3, 161
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
