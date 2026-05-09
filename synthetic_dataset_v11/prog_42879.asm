; DESCRIPTION: Renders a blue line between points (173, 168) and (211, 40).
; PLAN: r0=173(x1), r1=168(y1), r2=211(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 168
LDI r2, 211
LDI r3, 40
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
