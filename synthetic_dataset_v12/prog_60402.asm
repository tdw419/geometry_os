; DESCRIPTION: Creates a white rectangular region at (167, 175) spanning 68 by 32 pixels.
; PLAN: r0=167(x), r1=175(y), r2=68(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 175
LDI r2, 68
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
