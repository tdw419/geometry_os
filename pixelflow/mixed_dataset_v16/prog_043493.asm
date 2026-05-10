; DESCRIPTION: Renders a white box of size 111x83 starting at (245, 151).
; PLAN: r0=245(x), r1=151(y), r2=111(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 151
LDI r2, 111
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
