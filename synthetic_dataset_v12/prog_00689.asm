; DESCRIPTION: Renders a blue line between points (72, 205) and (253, 173).
; PLAN: r0=72(x1), r1=205(y1), r2=253(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 205
LDI r2, 253
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
