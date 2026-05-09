; DESCRIPTION: Creates a yellow rectangular region at (183, 57) spanning 61 by 81 pixels.
; PLAN: r0=183(x), r1=57(y), r2=61(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 57
LDI r2, 61
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
