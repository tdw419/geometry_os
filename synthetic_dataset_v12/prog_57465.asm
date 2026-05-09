; DESCRIPTION: Creates a orange rectangular region at (124, 207) spanning 53 by 10 pixels.
; PLAN: r0=124(x), r1=207(y), r2=53(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 207
LDI r2, 53
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
