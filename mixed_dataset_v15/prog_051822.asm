; DESCRIPTION: Draws a magenta line from (446, 114) to (178, 167).
; PLAN: r0=446(x1), r1=114(y1), r2=178(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 114
LDI r2, 178
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
