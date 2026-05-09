; DESCRIPTION: Draws a magenta line from (434, 17) to (78, 146).
; PLAN: r0=434(x1), r1=17(y1), r2=78(x2), r3=146(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 17
LDI r2, 78
LDI r3, 146
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
