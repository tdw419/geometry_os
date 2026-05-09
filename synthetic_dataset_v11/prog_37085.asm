; DESCRIPTION: Renders a green line between points (143, 0) and (7, 98).
; PLAN: r0=143(x1), r1=0(y1), r2=7(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 0
LDI r2, 7
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
