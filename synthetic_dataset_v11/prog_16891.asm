; DESCRIPTION: Composite: . Then Renders a blue line between points (224, 13) and (201, 154). Then Places a yellow dot at position (144, 209).
; PLAN: r0=224(x1), r1=13(y1), r2=201(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=144(x), r1=209(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue line between points (224, 13) and (201, 154).
; PLAN: r0=224(x1), r1=13(y1), r2=201(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 13
LDI r2, 201
LDI r3, 154
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (144, 209).
; PLAN: r0=144(x), r1=209(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 144
LDI r1, 209
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
