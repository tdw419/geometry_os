; DESCRIPTION: Renders a yellow line between points (280, 189) and (387, 102).
; PLAN: r0=280(x1), r1=189(y1), r2=387(x2), r3=102(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 189
LDI r2, 387
LDI r3, 102
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
