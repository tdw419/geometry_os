; DESCRIPTION: Creates a orange rectangular region at (218, 120) spanning 53 by 69 pixels.
; PLAN: r0=218(x), r1=120(y), r2=53(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 120
LDI r2, 53
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
