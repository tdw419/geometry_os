; DESCRIPTION: Renders a white box of size 78x25 starting at (173, 73).
; PLAN: r0=173(x), r1=73(y), r2=78(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 73
LDI r2, 78
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
