; DESCRIPTION: Draws a magenta line from (213, 200) to (247, 166).
; PLAN: r0=213(x1), r1=200(y1), r2=247(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 200
LDI r2, 247
LDI r3, 166
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
