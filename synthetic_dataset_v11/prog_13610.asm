; DESCRIPTION: Creates a orange rectangular region at (60, 38) spanning 72 by 119 pixels.
; PLAN: r0=60(x), r1=38(y), r2=72(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 38
LDI r2, 72
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
