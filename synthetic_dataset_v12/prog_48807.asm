; DESCRIPTION: Renders a white box of size 21x116 starting at (276, 74).
; PLAN: r0=276(x), r1=74(y), r2=21(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 74
LDI r2, 21
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
