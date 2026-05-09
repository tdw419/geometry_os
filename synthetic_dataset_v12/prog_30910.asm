; DESCRIPTION: Renders a black box of size 113x71 starting at (199, 49).
; PLAN: r0=199(x), r1=49(y), r2=113(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 49
LDI r2, 113
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
