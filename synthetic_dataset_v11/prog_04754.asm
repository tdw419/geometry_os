; DESCRIPTION: Creates a orange rectangular region at (67, 38) spanning 80 by 47 pixels.
; PLAN: r0=67(x), r1=38(y), r2=80(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 38
LDI r2, 80
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
