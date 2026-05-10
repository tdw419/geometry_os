; DESCRIPTION: Renders a white box of size 114x57 starting at (77, 151).
; PLAN: r0=77(x), r1=151(y), r2=114(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 151
LDI r2, 114
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
