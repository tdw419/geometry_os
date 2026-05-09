; DESCRIPTION: Draws a magenta line from (247, 130) to (171, 45).
; PLAN: r0=247(x1), r1=130(y1), r2=171(x2), r3=45(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 130
LDI r2, 171
LDI r3, 45
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
