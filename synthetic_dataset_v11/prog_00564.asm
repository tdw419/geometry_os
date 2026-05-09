; DESCRIPTION: Renders a white box of size 71x27 starting at (107, 151).
; PLAN: r0=107(x), r1=151(y), r2=71(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 151
LDI r2, 71
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
