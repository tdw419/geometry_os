; DESCRIPTION: Draws a magenta line from (319, 82) to (167, 249).
; PLAN: r0=319(x1), r1=82(y1), r2=167(x2), r3=249(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 82
LDI r2, 167
LDI r3, 249
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
