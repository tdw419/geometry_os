; DESCRIPTION: Creates a orange rectangular region at (359, 94) spanning 113 by 101 pixels.
; PLAN: r0=359(x), r1=94(y), r2=113(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 94
LDI r2, 113
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
