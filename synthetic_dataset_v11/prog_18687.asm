; DESCRIPTION: Renders a blue line between points (173, 143) and (8, 241).
; PLAN: r0=173(x1), r1=143(y1), r2=8(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 143
LDI r2, 8
LDI r3, 241
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
