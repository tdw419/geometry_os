; DESCRIPTION: Renders a blue line between points (64, 129) and (134, 215).
; PLAN: r0=64(x1), r1=129(y1), r2=134(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 129
LDI r2, 134
LDI r3, 215
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
