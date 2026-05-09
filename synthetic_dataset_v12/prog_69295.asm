; DESCRIPTION: Renders a magenta line between points (510, 185) and (209, 174).
; PLAN: r0=510(x1), r1=185(y1), r2=209(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 185
LDI r2, 209
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
