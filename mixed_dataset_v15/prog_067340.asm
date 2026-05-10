; DESCRIPTION: Creates a orange rectangular region at (344, 25) spanning 98 by 62 pixels.
; PLAN: r0=344(x), r1=25(y), r2=98(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 25
LDI r2, 98
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
