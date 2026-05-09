; DESCRIPTION: Renders a green line between points (114, 3) and (210, 10).
; PLAN: r0=114(x1), r1=3(y1), r2=210(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 3
LDI r2, 210
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
