; DESCRIPTION: Renders a blue line between points (173, 96) and (171, 109).
; PLAN: r0=173(x1), r1=96(y1), r2=171(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 96
LDI r2, 171
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
