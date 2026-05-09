; DESCRIPTION: Renders a magenta line between points (354, 186) and (272, 43).
; PLAN: r0=354(x1), r1=186(y1), r2=272(x2), r3=43(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 186
LDI r2, 272
LDI r3, 43
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
