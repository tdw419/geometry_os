; DESCRIPTION: Creates a orange rectangular region at (35, 70) spanning 67 by 75 pixels.
; PLAN: r0=35(x), r1=70(y), r2=67(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 70
LDI r2, 67
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
