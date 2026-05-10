; DESCRIPTION: Renders a magenta line segment connecting (298, 167) to (205, 103).
; PLAN: r0=298(x1), r1=167(y1), r2=205(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 167
LDI r2, 205
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
