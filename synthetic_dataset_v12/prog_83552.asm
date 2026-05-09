; DESCRIPTION: Creates a red rectangular region at (274, 2) spanning 97 by 67 pixels.
; PLAN: r0=274(x), r1=2(y), r2=97(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 2
LDI r2, 97
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
