; DESCRIPTION: Creates a orange rectangular region at (360, 119) spanning 61 by 34 pixels.
; PLAN: r0=360(x), r1=119(y), r2=61(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 119
LDI r2, 61
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
