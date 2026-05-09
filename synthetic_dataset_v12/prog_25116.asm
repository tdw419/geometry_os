; DESCRIPTION: Renders a green line between points (60, 15) and (150, 148).
; PLAN: r0=60(x1), r1=15(y1), r2=150(x2), r3=148(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 15
LDI r2, 150
LDI r3, 148
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
