; DESCRIPTION: Renders a blue line between points (312, 42) and (255, 237).
; PLAN: r0=312(x1), r1=42(y1), r2=255(x2), r3=237(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 42
LDI r2, 255
LDI r3, 237
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
