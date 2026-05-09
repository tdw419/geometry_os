; DESCRIPTION: Composite: . Then Renders a magenta box of size 72x34 starting at (91, 131). Then Renders a purple disk with center (42, 94) and radius 25.
; PLAN: r0=91(x), r1=131(y), r2=72(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=42(x), r1=94(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a magenta box of size 72x34 starting at (91, 131).
; PLAN: r0=91(x), r1=131(y), r2=72(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 131
LDI r2, 72
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (42, 94) and radius 25.
; PLAN: r0=42(x), r1=94(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 94
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
