; DESCRIPTION: Renders a magenta line between points (66, 213) and (173, 155).
; PLAN: r0=66(x1), r1=213(y1), r2=173(x2), r3=155(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 213
LDI r2, 173
LDI r3, 155
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
