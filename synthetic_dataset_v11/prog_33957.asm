; DESCRIPTION: Renders a green line between points (254, 153) and (57, 8).
; PLAN: r0=254(x1), r1=153(y1), r2=57(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 153
LDI r2, 57
LDI r3, 8
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
