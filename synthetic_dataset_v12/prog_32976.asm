; DESCRIPTION: Creates a white rectangular region at (116, 159) spanning 74 by 18 pixels.
; PLAN: r0=116(x), r1=159(y), r2=74(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 159
LDI r2, 74
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
