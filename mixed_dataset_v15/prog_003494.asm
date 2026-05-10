; DESCRIPTION: Renders a green line between points (230, 33) and (119, 134).
; PLAN: r0=230(x1), r1=33(y1), r2=119(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 33
LDI r2, 119
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
