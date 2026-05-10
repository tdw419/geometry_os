; DESCRIPTION: Renders a green line between points (194, 196) and (61, 0).
; PLAN: r0=194(x1), r1=196(y1), r2=61(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 196
LDI r2, 61
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
