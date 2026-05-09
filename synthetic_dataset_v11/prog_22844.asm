; DESCRIPTION: Renders a blue line between points (2, 61) and (16, 173).
; PLAN: r0=2(x1), r1=61(y1), r2=16(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 61
LDI r2, 16
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
