; DESCRIPTION: Renders a yellow line between points (239, 201) and (202, 19).
; PLAN: r0=239(x1), r1=201(y1), r2=202(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 201
LDI r2, 202
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
