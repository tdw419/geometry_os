; DESCRIPTION: Renders a magenta line segment connecting (284, 56) to (221, 112).
; PLAN: r0=284(x1), r1=56(y1), r2=221(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 56
LDI r2, 221
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
