; DESCRIPTION: Creates a orange rectangular region at (70, 15) spanning 74 by 108 pixels.
; PLAN: r0=70(x), r1=15(y), r2=74(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 15
LDI r2, 74
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
