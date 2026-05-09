; DESCRIPTION: Renders a green line between points (91, 82) and (151, 160).
; PLAN: r0=91(x1), r1=82(y1), r2=151(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 82
LDI r2, 151
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
