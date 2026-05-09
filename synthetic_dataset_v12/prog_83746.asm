; DESCRIPTION: Renders a yellow line between points (487, 108) and (106, 239).
; PLAN: r0=487(x1), r1=108(y1), r2=106(x2), r3=239(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 108
LDI r2, 106
LDI r3, 239
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
