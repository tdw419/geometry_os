; DESCRIPTION: Draws a magenta line from (102, 27) to (25, 72).
; PLAN: r0=102(x1), r1=27(y1), r2=25(x2), r3=72(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 27
LDI r2, 25
LDI r3, 72
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
