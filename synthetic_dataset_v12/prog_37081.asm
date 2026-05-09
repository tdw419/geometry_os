; DESCRIPTION: Draws a magenta line from (66, 171) to (82, 81).
; PLAN: r0=66(x1), r1=171(y1), r2=82(x2), r3=81(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 171
LDI r2, 82
LDI r3, 81
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
