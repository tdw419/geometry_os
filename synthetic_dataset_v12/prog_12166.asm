; DESCRIPTION: Renders a magenta line between points (181, 241) and (239, 250).
; PLAN: r0=181(x1), r1=241(y1), r2=239(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 241
LDI r2, 239
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
