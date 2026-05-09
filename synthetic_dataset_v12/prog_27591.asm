; DESCRIPTION: Draws a magenta line from (178, 135) to (149, 209).
; PLAN: r0=178(x1), r1=135(y1), r2=149(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 135
LDI r2, 149
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
