; DESCRIPTION: Creates a orange rectangular region at (153, 68) spanning 95 by 98 pixels.
; PLAN: r0=153(x), r1=68(y), r2=95(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 68
LDI r2, 95
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
