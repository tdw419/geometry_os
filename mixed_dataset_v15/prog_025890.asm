; DESCRIPTION: Renders a green line between points (11, 161) and (31, 239).
; PLAN: r0=11(x1), r1=161(y1), r2=31(x2), r3=239(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 161
LDI r2, 31
LDI r3, 239
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
