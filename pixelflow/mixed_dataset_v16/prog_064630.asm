; DESCRIPTION: Renders a white box of size 18x52 starting at (96, 183).
; PLAN: r0=96(x), r1=183(y), r2=18(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 183
LDI r2, 18
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
