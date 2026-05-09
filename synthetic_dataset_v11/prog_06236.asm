; DESCRIPTION: Renders a green line between points (199, 160) and (37, 108).
; PLAN: r0=199(x1), r1=160(y1), r2=37(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 160
LDI r2, 37
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
