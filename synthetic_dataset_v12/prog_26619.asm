; DESCRIPTION: Creates a orange rectangular region at (6, 58) spanning 39 by 45 pixels.
; PLAN: r0=6(x), r1=58(y), r2=39(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 58
LDI r2, 39
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
