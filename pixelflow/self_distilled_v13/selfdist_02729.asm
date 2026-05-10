; DESCRIPTION: Renders a green line segment connecting (73, 32) to (299, 122).
; PLAN: r0=73(x1), r1=32(y1), r2=299(x2), r3=122(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 32
LDI r2, 299
LDI r3, 122
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
