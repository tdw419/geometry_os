; DESCRIPTION: Renders a green line between points (151, 108) and (212, 46).
; PLAN: r0=151(x1), r1=108(y1), r2=212(x2), r3=46(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 108
LDI r2, 212
LDI r3, 46
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
