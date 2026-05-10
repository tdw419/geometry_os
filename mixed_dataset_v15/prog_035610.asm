; DESCRIPTION: Creates a orange rectangular region at (93, 82) spanning 104 by 88 pixels.
; PLAN: r0=93(x), r1=82(y), r2=104(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 82
LDI r2, 104
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
