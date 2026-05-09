; DESCRIPTION: Composite: . Then Renders a red disk with center (101, 211) and radius 32. Then Renders a magenta line between points (42, 170) and (165, 36).
; PLAN: r0=101(x), r1=211(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=42(x1), r1=170(y1), r2=165(x2), r3=36(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red disk with center (101, 211) and radius 32.
; PLAN: r0=101(x), r1=211(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 211
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a magenta line between points (42, 170) and (165, 36).
; PLAN: r0=42(x1), r1=170(y1), r2=165(x2), r3=36(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 170
LDI r2, 165
LDI r3, 36
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
