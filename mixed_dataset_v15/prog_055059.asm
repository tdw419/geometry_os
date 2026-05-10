; DESCRIPTION: Renders a green line between points (12, 53) and (256, 4).
; PLAN: r0=12(x1), r1=53(y1), r2=256(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 53
LDI r2, 256
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
