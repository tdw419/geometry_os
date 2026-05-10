; DESCRIPTION: Creates a white rectangular region at (81, 36) spanning 61 by 114 pixels.
; PLAN: r0=81(x), r1=36(y), r2=61(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 36
LDI r2, 61
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
