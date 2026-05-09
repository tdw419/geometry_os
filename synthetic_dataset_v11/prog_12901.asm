; DESCRIPTION: Renders a green line between points (33, 115) and (122, 208).
; PLAN: r0=33(x1), r1=115(y1), r2=122(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 115
LDI r2, 122
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
