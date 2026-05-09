; DESCRIPTION: Creates a orange rectangular region at (111, 34) spanning 71 by 82 pixels.
; PLAN: r0=111(x), r1=34(y), r2=71(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 34
LDI r2, 71
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
