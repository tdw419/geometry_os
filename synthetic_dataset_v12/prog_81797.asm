; DESCRIPTION: Creates a red rectangular region at (359, 15) spanning 21 by 113 pixels.
; PLAN: r0=359(x), r1=15(y), r2=21(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 15
LDI r2, 21
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
