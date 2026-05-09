; DESCRIPTION: Renders a green line between points (350, 85) and (64, 72).
; PLAN: r0=350(x1), r1=85(y1), r2=64(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 85
LDI r2, 64
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
