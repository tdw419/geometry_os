; DESCRIPTION: Renders a black line between points (239, 96) and (170, 9).
; PLAN: r0=239(x1), r1=96(y1), r2=170(x2), r3=9(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 96
LDI r2, 170
LDI r3, 9
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
