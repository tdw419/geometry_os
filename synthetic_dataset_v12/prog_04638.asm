; DESCRIPTION: Renders a green line between points (218, 151) and (61, 100).
; PLAN: r0=218(x1), r1=151(y1), r2=61(x2), r3=100(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 151
LDI r2, 61
LDI r3, 100
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
