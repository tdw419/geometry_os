; DESCRIPTION: Composite: . Then Renders a black box of size 100x65 starting at (4, 78). Then Sets a single white pixel at (244, 253).
; PLAN: r0=4(x), r1=78(y), r2=100(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=244(x), r1=253(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black box of size 100x65 starting at (4, 78).
; PLAN: r0=4(x), r1=78(y), r2=100(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 78
LDI r2, 100
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (244, 253).
; PLAN: r0=244(x), r1=253(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 244
LDI r1, 253
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
