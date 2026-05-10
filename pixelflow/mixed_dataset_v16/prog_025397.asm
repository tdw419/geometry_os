; DESCRIPTION: Creates a orange rectangular region at (400, 38) spanning 44 by 53 pixels.
; PLAN: r0=400(x), r1=38(y), r2=44(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 38
LDI r2, 44
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
