; DESCRIPTION: Renders a green line between points (69, 24) and (79, 225).
; PLAN: r0=69(x1), r1=24(y1), r2=79(x2), r3=225(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 24
LDI r2, 79
LDI r3, 225
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
