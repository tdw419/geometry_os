; DESCRIPTION: Composite: . Then Sets a single white pixel at (144, 189). Then Renders a red box of size 67x28 starting at (141, 26).
; PLAN: r0=144(x), r1=189(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=141(x), r1=26(y), r2=67(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (144, 189).
; PLAN: r0=144(x), r1=189(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 144
LDI r1, 189
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a red box of size 67x28 starting at (141, 26).
; PLAN: r0=141(x), r1=26(y), r2=67(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 26
LDI r2, 67
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
