; DESCRIPTION: Renders a blue line between points (338, 255) and (291, 64).
; PLAN: r0=338(x1), r1=255(y1), r2=291(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 255
LDI r2, 291
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
