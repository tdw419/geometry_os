; DESCRIPTION: Renders a white box of size 64x44 starting at (122, 109).
; PLAN: r0=122(x), r1=109(y), r2=64(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 109
LDI r2, 64
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
