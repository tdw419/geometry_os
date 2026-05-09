; DESCRIPTION: Renders a white line between points (173, 32) and (106, 232).
; PLAN: r0=173(x1), r1=32(y1), r2=106(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 32
LDI r2, 106
LDI r3, 232
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
