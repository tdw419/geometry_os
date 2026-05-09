; DESCRIPTION: Creates a red rectangular region at (135, 116) spanning 60 by 53 pixels.
; PLAN: r0=135(x), r1=116(y), r2=60(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 116
LDI r2, 60
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
