; DESCRIPTION: Draws a magenta line from (306, 166) to (483, 213).
; PLAN: r0=306(x1), r1=166(y1), r2=483(x2), r3=213(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 166
LDI r2, 483
LDI r3, 213
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
