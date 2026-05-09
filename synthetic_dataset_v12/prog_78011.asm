; DESCRIPTION: Creates a red rectangular region at (286, 175) spanning 28 by 72 pixels.
; PLAN: r0=286(x), r1=175(y), r2=28(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 175
LDI r2, 28
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
