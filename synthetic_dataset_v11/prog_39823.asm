; DESCRIPTION: Composite: . Then Renders a cyan disk with center (72, 71) and radius 62. Then Renders a blue box of size 71x71 starting at (11, 10).
; PLAN: r0=72(x), r1=71(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=11(x), r1=10(y), r2=71(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan disk with center (72, 71) and radius 62.
; PLAN: r0=72(x), r1=71(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 71
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a blue box of size 71x71 starting at (11, 10).
; PLAN: r0=11(x), r1=10(y), r2=71(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 10
LDI r2, 71
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
