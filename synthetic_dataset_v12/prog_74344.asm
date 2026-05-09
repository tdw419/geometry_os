; DESCRIPTION: Renders a blue line between points (256, 23) and (189, 16).
; PLAN: r0=256(x1), r1=23(y1), r2=189(x2), r3=16(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 23
LDI r2, 189
LDI r3, 16
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
