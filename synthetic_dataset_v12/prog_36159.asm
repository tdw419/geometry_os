; DESCRIPTION: Creates a orange rectangular region at (238, 39) spanning 20 by 25 pixels.
; PLAN: r0=238(x), r1=39(y), r2=20(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 39
LDI r2, 20
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
