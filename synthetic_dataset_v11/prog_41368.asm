; DESCRIPTION: Renders a green line between points (61, 120) and (168, 145).
; PLAN: r0=61(x1), r1=120(y1), r2=168(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 120
LDI r2, 168
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
