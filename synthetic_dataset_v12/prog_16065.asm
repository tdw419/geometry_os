; DESCRIPTION: Renders a magenta line between points (239, 3) and (331, 116).
; PLAN: r0=239(x1), r1=3(y1), r2=331(x2), r3=116(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 3
LDI r2, 331
LDI r3, 116
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
