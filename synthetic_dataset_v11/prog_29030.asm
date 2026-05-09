; DESCRIPTION: Renders a green line between points (36, 96) and (17, 239).
; PLAN: r0=36(x1), r1=96(y1), r2=17(x2), r3=239(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 96
LDI r2, 17
LDI r3, 239
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
