; DESCRIPTION: Renders a white box of size 71x116 starting at (150, 56).
; PLAN: r0=150(x), r1=56(y), r2=71(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 56
LDI r2, 71
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
