; DESCRIPTION: Renders a white box of size 116x44 starting at (246, 19).
; PLAN: r0=246(x), r1=19(y), r2=116(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 19
LDI r2, 116
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
