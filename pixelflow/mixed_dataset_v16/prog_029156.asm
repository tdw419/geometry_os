; DESCRIPTION: Renders a yellow line between points (136, 239) and (385, 117).
; PLAN: r0=136(x1), r1=239(y1), r2=385(x2), r3=117(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 239
LDI r2, 385
LDI r3, 117
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
