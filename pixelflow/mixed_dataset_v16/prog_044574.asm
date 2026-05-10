; DESCRIPTION: Creates a red rectangular region at (96, 156) spanning 45 by 39 pixels.
; PLAN: r0=96(x), r1=156(y), r2=45(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 156
LDI r2, 45
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
