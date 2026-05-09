; DESCRIPTION: Renders a green line between points (72, 142) and (17, 239).
; PLAN: r0=72(x1), r1=142(y1), r2=17(x2), r3=239(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 142
LDI r2, 17
LDI r3, 239
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
