; DESCRIPTION: Renders a magenta line between points (195, 240) and (221, 108).
; PLAN: r0=195(x1), r1=240(y1), r2=221(x2), r3=108(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 240
LDI r2, 221
LDI r3, 108
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
