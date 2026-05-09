; DESCRIPTION: Creates a orange rectangular region at (416, 74) spanning 33 by 26 pixels.
; PLAN: r0=416(x), r1=74(y), r2=33(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 74
LDI r2, 33
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
