; DESCRIPTION: Renders a magenta line segment connecting (324, 178) to (265, 125).
; PLAN: r0=324(x1), r1=178(y1), r2=265(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 178
LDI r2, 265
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
