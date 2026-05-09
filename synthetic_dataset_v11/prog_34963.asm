; DESCRIPTION: Composite: . Then Places a green line segment connecting (42, 210) to (184, 53). Then Renders a orange disk with center (96, 130) and radius 78.
; PLAN: r0=42(x1), r1=210(y1), r2=184(x2), r3=53(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=96(x), r1=130(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green line segment connecting (42, 210) to (184, 53).
; PLAN: r0=42(x1), r1=210(y1), r2=184(x2), r3=53(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 210
LDI r2, 184
LDI r3, 53
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange disk with center (96, 130) and radius 78.
; PLAN: r0=96(x), r1=130(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 130
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
