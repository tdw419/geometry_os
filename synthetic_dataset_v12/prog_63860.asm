; DESCRIPTION: Renders a magenta line between points (239, 21) and (245, 136).
; PLAN: r0=239(x1), r1=21(y1), r2=245(x2), r3=136(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 21
LDI r2, 245
LDI r3, 136
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
