; DESCRIPTION: Creates a red rectangular region at (166, 28) spanning 21 by 116 pixels.
; PLAN: r0=166(x), r1=28(y), r2=21(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 28
LDI r2, 21
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
