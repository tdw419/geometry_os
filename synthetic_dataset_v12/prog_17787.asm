; DESCRIPTION: Renders a white box of size 74x107 starting at (128, 131).
; PLAN: r0=128(x), r1=131(y), r2=74(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 131
LDI r2, 74
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
