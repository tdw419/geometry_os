; DESCRIPTION: Renders a magenta line between points (156, 205) and (391, 57).
; PLAN: r0=156(x1), r1=205(y1), r2=391(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 205
LDI r2, 391
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
