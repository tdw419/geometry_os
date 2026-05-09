; DESCRIPTION: Renders a green line between points (193, 98) and (28, 120).
; PLAN: r0=193(x1), r1=98(y1), r2=28(x2), r3=120(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 98
LDI r2, 28
LDI r3, 120
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
