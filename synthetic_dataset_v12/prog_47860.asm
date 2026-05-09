; DESCRIPTION: Creates a red rectangular region at (397, 70) spanning 43 by 111 pixels.
; PLAN: r0=397(x), r1=70(y), r2=43(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 70
LDI r2, 43
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
