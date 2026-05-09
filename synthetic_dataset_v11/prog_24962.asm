; DESCRIPTION: Renders a green line between points (146, 126) and (250, 44).
; PLAN: r0=146(x1), r1=126(y1), r2=250(x2), r3=44(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 126
LDI r2, 250
LDI r3, 44
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
