; DESCRIPTION: Creates a red rectangular region at (359, 60) spanning 105 by 103 pixels.
; PLAN: r0=359(x), r1=60(y), r2=105(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 60
LDI r2, 105
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
