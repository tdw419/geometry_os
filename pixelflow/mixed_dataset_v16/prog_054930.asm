; DESCRIPTION: Draws a magenta line from (373, 146) to (210, 43).
; PLAN: r0=373(x1), r1=146(y1), r2=210(x2), r3=43(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 146
LDI r2, 210
LDI r3, 43
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
