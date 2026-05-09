; DESCRIPTION: Renders a magenta line between points (303, 176) and (156, 244).
; PLAN: r0=303(x1), r1=176(y1), r2=156(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 176
LDI r2, 156
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
