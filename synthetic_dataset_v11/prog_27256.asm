; DESCRIPTION: Renders a green line between points (254, 151) and (206, 122).
; PLAN: r0=254(x1), r1=151(y1), r2=206(x2), r3=122(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 151
LDI r2, 206
LDI r3, 122
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
