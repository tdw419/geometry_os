; DESCRIPTION: Renders a white box of size 120x12 starting at (264, 116).
; PLAN: r0=264(x), r1=116(y), r2=120(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 116
LDI r2, 120
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
