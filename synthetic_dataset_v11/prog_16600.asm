; DESCRIPTION: Composite: . Then Renders a blue disk with center (123, 150) and radius 42. Then Places a red line segment connecting (107, 66) to (154, 73).
; PLAN: r0=123(x), r1=150(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=107(x1), r1=66(y1), r2=154(x2), r3=73(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue disk with center (123, 150) and radius 42.
; PLAN: r0=123(x), r1=150(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 150
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red line segment connecting (107, 66) to (154, 73).
; PLAN: r0=107(x1), r1=66(y1), r2=154(x2), r3=73(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 66
LDI r2, 154
LDI r3, 73
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
