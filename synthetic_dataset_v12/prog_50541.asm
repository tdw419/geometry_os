; DESCRIPTION: Creates a red rectangular region at (413, 49) spanning 39 by 84 pixels.
; PLAN: r0=413(x), r1=49(y), r2=39(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 49
LDI r2, 39
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
