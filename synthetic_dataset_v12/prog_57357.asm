; DESCRIPTION: Creates a orange rectangular region at (265, 30) spanning 111 by 101 pixels.
; PLAN: r0=265(x), r1=30(y), r2=111(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 30
LDI r2, 111
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
