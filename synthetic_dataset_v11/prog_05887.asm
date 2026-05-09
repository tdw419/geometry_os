; DESCRIPTION: Renders a magenta line between points (127, 27) and (195, 26).
; PLAN: r0=127(x1), r1=27(y1), r2=195(x2), r3=26(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 27
LDI r2, 195
LDI r3, 26
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
