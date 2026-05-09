; DESCRIPTION: Composite: . Then Places a magenta circle of radius 63 at center (154, 85). Then Renders a magenta line between points (50, 36) and (152, 181).
; PLAN: r0=154(x), r1=85(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=50(x1), r1=36(y1), r2=152(x2), r3=181(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta circle of radius 63 at center (154, 85).
; PLAN: r0=154(x), r1=85(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 85
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a magenta line between points (50, 36) and (152, 181).
; PLAN: r0=50(x1), r1=36(y1), r2=152(x2), r3=181(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 36
LDI r2, 152
LDI r3, 181
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
