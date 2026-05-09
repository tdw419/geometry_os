; DESCRIPTION: Renders a magenta line between points (167, 151) and (46, 203).
; PLAN: r0=167(x1), r1=151(y1), r2=46(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 151
LDI r2, 46
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
