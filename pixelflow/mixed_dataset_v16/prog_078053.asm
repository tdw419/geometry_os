; DESCRIPTION: Renders a green line between points (420, 151) and (376, 98).
; PLAN: r0=420(x1), r1=151(y1), r2=376(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 151
LDI r2, 376
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
