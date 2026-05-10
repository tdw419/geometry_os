; DESCRIPTION: Renders a magenta line segment connecting (247, 35) to (292, 107).
; PLAN: r0=247(x1), r1=35(y1), r2=292(x2), r3=107(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 35
LDI r2, 292
LDI r3, 107
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
