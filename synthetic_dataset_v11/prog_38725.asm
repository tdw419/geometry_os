; DESCRIPTION: Renders a white box of size 111x12 starting at (14, 194).
; PLAN: r0=14(x), r1=194(y), r2=111(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 194
LDI r2, 111
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
