; DESCRIPTION: Composite: . Then Renders a cyan box of size 62x65 starting at (38, 10). Then Creates a white circular shape at (50, 43) with radius 41.
; PLAN: r0=38(x), r1=10(y), r2=62(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=50(x), r1=43(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan box of size 62x65 starting at (38, 10).
; PLAN: r0=38(x), r1=10(y), r2=62(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 10
LDI r2, 62
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white circular shape at (50, 43) with radius 41.
; PLAN: r0=50(x), r1=43(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 43
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
