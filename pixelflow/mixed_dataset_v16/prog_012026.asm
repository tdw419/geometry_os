; DESCRIPTION: Draws a magenta line from (245, 202) to (156, 171).
; PLAN: r0=245(x1), r1=202(y1), r2=156(x2), r3=171(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 202
LDI r2, 156
LDI r3, 171
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
