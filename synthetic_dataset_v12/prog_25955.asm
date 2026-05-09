; DESCRIPTION: Creates a yellow rectangular region at (299, 68) spanning 26 by 47 pixels.
; PLAN: r0=299(x), r1=68(y), r2=26(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 68
LDI r2, 26
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
