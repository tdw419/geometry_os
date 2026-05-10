; DESCRIPTION: Creates a orange rectangular region at (59, 109) spanning 95 by 114 pixels.
; PLAN: r0=59(x), r1=109(y), r2=95(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 109
LDI r2, 95
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
