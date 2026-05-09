; DESCRIPTION: Renders a white box of size 32x60 starting at (114, 148).
; PLAN: r0=114(x), r1=148(y), r2=32(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 148
LDI r2, 32
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
