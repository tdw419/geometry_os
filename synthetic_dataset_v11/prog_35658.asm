; DESCRIPTION: Composite: . Then Draws a magenta line from (6, 74) to (224, 225). Then Renders a white disk with center (156, 112) and radius 80.
; PLAN: r0=6(x1), r1=74(y1), r2=224(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=156(x), r1=112(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a magenta line from (6, 74) to (224, 225).
; PLAN: r0=6(x1), r1=74(y1), r2=224(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 74
LDI r2, 224
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white disk with center (156, 112) and radius 80.
; PLAN: r0=156(x), r1=112(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 112
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
