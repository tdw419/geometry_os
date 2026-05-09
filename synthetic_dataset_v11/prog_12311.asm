; DESCRIPTION: Renders a white box of size 32x43 starting at (126, 45).
; PLAN: r0=126(x), r1=45(y), r2=32(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 45
LDI r2, 32
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
