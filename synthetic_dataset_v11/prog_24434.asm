; DESCRIPTION: Renders a green line between points (210, 181) and (189, 134).
; PLAN: r0=210(x1), r1=181(y1), r2=189(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 181
LDI r2, 189
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
