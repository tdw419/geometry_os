; DESCRIPTION: Composite: . Then Renders a orange box of size 116x86 starting at (3, 142). Then Sets a single white pixel at (101, 36).
; PLAN: r0=3(x), r1=142(y), r2=116(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=101(x), r1=36(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange box of size 116x86 starting at (3, 142).
; PLAN: r0=3(x), r1=142(y), r2=116(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 142
LDI r2, 116
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (101, 36).
; PLAN: r0=101(x), r1=36(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 101
LDI r1, 36
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
