; DESCRIPTION: Renders a green line between points (223, 68) and (87, 134).
; PLAN: r0=223(x1), r1=68(y1), r2=87(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 68
LDI r2, 87
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
