; DESCRIPTION: Renders a green line between points (210, 77) and (209, 149).
; PLAN: r0=210(x1), r1=77(y1), r2=209(x2), r3=149(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 77
LDI r2, 209
LDI r3, 149
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
