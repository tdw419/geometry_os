; DESCRIPTION: Creates a orange rectangular region at (380, 14) spanning 111 by 39 pixels.
; PLAN: r0=380(x), r1=14(y), r2=111(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 14
LDI r2, 111
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
