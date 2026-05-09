; DESCRIPTION: Creates a orange rectangular region at (139, 6) spanning 113 by 25 pixels.
; PLAN: r0=139(x), r1=6(y), r2=113(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 6
LDI r2, 113
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
