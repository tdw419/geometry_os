; DESCRIPTION: Renders a green line between points (102, 86) and (511, 209).
; PLAN: r0=102(x1), r1=86(y1), r2=511(x2), r3=209(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 86
LDI r2, 511
LDI r3, 209
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
