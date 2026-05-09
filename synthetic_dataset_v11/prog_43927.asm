; DESCRIPTION: Renders a green line between points (73, 249) and (48, 49).
; PLAN: r0=73(x1), r1=249(y1), r2=48(x2), r3=49(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 249
LDI r2, 48
LDI r3, 49
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
