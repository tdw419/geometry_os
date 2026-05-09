; DESCRIPTION: Creates a orange rectangular region at (60, 163) spanning 114 by 30 pixels.
; PLAN: r0=60(x), r1=163(y), r2=114(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 163
LDI r2, 114
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
