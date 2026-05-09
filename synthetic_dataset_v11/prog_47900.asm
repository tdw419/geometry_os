; DESCRIPTION: Renders a green line between points (29, 28) and (120, 98).
; PLAN: r0=29(x1), r1=28(y1), r2=120(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 28
LDI r2, 120
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
