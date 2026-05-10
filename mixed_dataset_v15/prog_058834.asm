; DESCRIPTION: Renders a green line between points (283, 92) and (193, 120).
; PLAN: r0=283(x1), r1=92(y1), r2=193(x2), r3=120(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 92
LDI r2, 193
LDI r3, 120
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
