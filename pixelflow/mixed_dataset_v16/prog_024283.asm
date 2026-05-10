; DESCRIPTION: Creates a orange rectangular region at (416, 143) spanning 76 by 97 pixels.
; PLAN: r0=416(x), r1=143(y), r2=76(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 143
LDI r2, 76
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
