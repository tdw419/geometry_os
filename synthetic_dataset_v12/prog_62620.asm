; DESCRIPTION: Creates a orange rectangular region at (39, 74) spanning 119 by 83 pixels.
; PLAN: r0=39(x), r1=74(y), r2=119(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 74
LDI r2, 119
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
