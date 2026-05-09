; DESCRIPTION: Renders a green line between points (191, 23) and (164, 98).
; PLAN: r0=191(x1), r1=23(y1), r2=164(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 23
LDI r2, 164
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
