; DESCRIPTION: Composite: . Then Renders a magenta disk with center (58, 122) and radius 19. Then Renders a magenta box of size 66x38 starting at (128, 130).
; PLAN: r0=58(x), r1=122(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=128(x), r1=130(y), r2=66(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta disk with center (58, 122) and radius 19.
; PLAN: r0=58(x), r1=122(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 122
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a magenta box of size 66x38 starting at (128, 130).
; PLAN: r0=128(x), r1=130(y), r2=66(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 130
LDI r2, 66
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
