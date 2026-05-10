; DESCRIPTION: Creates a orange rectangular region at (9, 121) spanning 68 by 47 pixels.
; PLAN: r0=9(x), r1=121(y), r2=68(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 121
LDI r2, 68
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
