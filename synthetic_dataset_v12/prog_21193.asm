; DESCRIPTION: Creates a red rectangular region at (232, 43) spanning 16 by 70 pixels.
; PLAN: r0=232(x), r1=43(y), r2=16(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 43
LDI r2, 16
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
