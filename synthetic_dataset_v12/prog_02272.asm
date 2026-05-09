; DESCRIPTION: Renders a green line between points (256, 150) and (60, 53).
; PLAN: r0=256(x1), r1=150(y1), r2=60(x2), r3=53(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 150
LDI r2, 60
LDI r3, 53
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
