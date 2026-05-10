; DESCRIPTION: Creates a red rectangular region at (246, 37) spanning 83 by 35 pixels.
; PLAN: r0=246(x), r1=37(y), r2=83(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 37
LDI r2, 83
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
