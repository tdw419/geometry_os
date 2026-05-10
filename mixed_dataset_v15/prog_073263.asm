; DESCRIPTION: Creates a magenta rectangular region at (416, 192) spanning 26 by 41 pixels.
; PLAN: r0=416(x), r1=192(y), r2=26(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 192
LDI r2, 26
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
