; DESCRIPTION: Draws a magenta line from (171, 166) to (353, 93).
; PLAN: r0=171(x1), r1=166(y1), r2=353(x2), r3=93(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 166
LDI r2, 353
LDI r3, 93
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
