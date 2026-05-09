; DESCRIPTION: Creates a orange rectangular region at (93, 38) spanning 32 by 55 pixels.
; PLAN: r0=93(x), r1=38(y), r2=32(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 38
LDI r2, 32
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
