; DESCRIPTION: Renders a white box of size 37x38 starting at (116, 30).
; PLAN: r0=116(x), r1=30(y), r2=37(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 30
LDI r2, 37
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
