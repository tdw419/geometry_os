; DESCRIPTION: Renders a magenta line between points (174, 28) and (195, 173).
; PLAN: r0=174(x1), r1=28(y1), r2=195(x2), r3=173(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 28
LDI r2, 195
LDI r3, 173
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
