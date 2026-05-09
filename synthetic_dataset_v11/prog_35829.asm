; DESCRIPTION: Creates a red rectangular region at (189, 143) spanning 25 by 67 pixels.
; PLAN: r0=189(x), r1=143(y), r2=25(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 143
LDI r2, 25
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
