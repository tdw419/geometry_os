; DESCRIPTION: Renders a black line between points (239, 23) and (99, 160).
; PLAN: r0=239(x1), r1=23(y1), r2=99(x2), r3=160(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 23
LDI r2, 99
LDI r3, 160
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
