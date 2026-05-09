; DESCRIPTION: Draws a magenta line from (45, 209) to (303, 101).
; PLAN: r0=45(x1), r1=209(y1), r2=303(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 209
LDI r2, 303
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
