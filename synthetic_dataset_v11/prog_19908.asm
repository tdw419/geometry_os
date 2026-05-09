; DESCRIPTION: Composite: . Then Creates a purple circular shape at (47, 98) with radius 41. Then Renders a cyan box of size 72x71 starting at (64, 66).
; PLAN: r0=47(x), r1=98(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=64(x), r1=66(y), r2=72(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple circular shape at (47, 98) with radius 41.
; PLAN: r0=47(x), r1=98(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 47
LDI r1, 98
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a cyan box of size 72x71 starting at (64, 66).
; PLAN: r0=64(x), r1=66(y), r2=72(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 66
LDI r2, 72
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
