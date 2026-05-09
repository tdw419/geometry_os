; DESCRIPTION: Renders a blue line between points (160, 124) and (173, 195).
; PLAN: r0=160(x1), r1=124(y1), r2=173(x2), r3=195(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 124
LDI r2, 173
LDI r3, 195
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
