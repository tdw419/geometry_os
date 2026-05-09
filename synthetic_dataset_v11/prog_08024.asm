; DESCRIPTION: Composite: . Then Renders a blue disk with center (154, 174) and radius 63. Then Renders a magenta line between points (126, 36) and (72, 242).
; PLAN: r0=154(x), r1=174(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=126(x1), r1=36(y1), r2=72(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue disk with center (154, 174) and radius 63.
; PLAN: r0=154(x), r1=174(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 174
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a magenta line between points (126, 36) and (72, 242).
; PLAN: r0=126(x1), r1=36(y1), r2=72(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 36
LDI r2, 72
LDI r3, 242
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
