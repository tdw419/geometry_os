; DESCRIPTION: Composite: . Then Renders a orange disk with center (42, 135) and radius 19. Then Renders a black box of size 52x119 starting at (137, 71).
; PLAN: r0=42(x), r1=135(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=137(x), r1=71(y), r2=52(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange disk with center (42, 135) and radius 19.
; PLAN: r0=42(x), r1=135(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 135
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a black box of size 52x119 starting at (137, 71).
; PLAN: r0=137(x), r1=71(y), r2=52(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 71
LDI r2, 52
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
