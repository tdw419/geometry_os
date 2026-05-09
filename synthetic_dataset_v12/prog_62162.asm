; DESCRIPTION: Creates a orange rectangular region at (55, 60) spanning 115 by 67 pixels.
; PLAN: r0=55(x), r1=60(y), r2=115(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 60
LDI r2, 115
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
