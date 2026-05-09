; DESCRIPTION: Renders a magenta line between points (222, 17) and (173, 211).
; PLAN: r0=222(x1), r1=17(y1), r2=173(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 17
LDI r2, 173
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
