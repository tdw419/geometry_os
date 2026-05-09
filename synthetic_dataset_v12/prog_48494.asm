; DESCRIPTION: Renders a green line between points (8, 25) and (163, 210).
; PLAN: r0=8(x1), r1=25(y1), r2=163(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 25
LDI r2, 163
LDI r3, 210
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
