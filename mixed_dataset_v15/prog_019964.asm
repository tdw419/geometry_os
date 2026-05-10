; DESCRIPTION: Renders a magenta line between points (171, 241) and (399, 178).
; PLAN: r0=171(x1), r1=241(y1), r2=399(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 241
LDI r2, 399
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
