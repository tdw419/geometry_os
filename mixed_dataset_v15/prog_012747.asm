; DESCRIPTION: Renders a white box of size 40x49 starting at (128, 71).
; PLAN: r0=128(x), r1=71(y), r2=40(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 71
LDI r2, 40
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
