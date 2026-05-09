; DESCRIPTION: Renders a magenta line between points (362, 171) and (110, 209).
; PLAN: r0=362(x1), r1=171(y1), r2=110(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 171
LDI r2, 110
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
