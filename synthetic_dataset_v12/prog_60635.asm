; DESCRIPTION: Creates a orange rectangular region at (352, 48) spanning 82 by 114 pixels.
; PLAN: r0=352(x), r1=48(y), r2=82(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 48
LDI r2, 82
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
