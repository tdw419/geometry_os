; DESCRIPTION: Renders a yellow line between points (409, 111) and (285, 196).
; PLAN: r0=409(x1), r1=111(y1), r2=285(x2), r3=196(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 111
LDI r2, 285
LDI r3, 196
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
