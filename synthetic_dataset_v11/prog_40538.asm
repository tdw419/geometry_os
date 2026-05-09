; DESCRIPTION: Composite: . Then Renders a black box of size 56x23 starting at (177, 38). Then Renders a purple disk with center (145, 61) and radius 42.
; PLAN: r0=177(x), r1=38(y), r2=56(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=145(x), r1=61(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black box of size 56x23 starting at (177, 38).
; PLAN: r0=177(x), r1=38(y), r2=56(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 38
LDI r2, 56
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (145, 61) and radius 42.
; PLAN: r0=145(x), r1=61(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 61
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
