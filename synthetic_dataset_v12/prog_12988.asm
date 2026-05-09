; DESCRIPTION: Renders a yellow line between points (123, 239) and (56, 248).
; PLAN: r0=123(x1), r1=239(y1), r2=56(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 239
LDI r2, 56
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
