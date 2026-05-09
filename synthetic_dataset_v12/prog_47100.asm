; DESCRIPTION: Draws a magenta line from (317, 130) to (118, 143).
; PLAN: r0=317(x1), r1=130(y1), r2=118(x2), r3=143(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 130
LDI r2, 118
LDI r3, 143
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
