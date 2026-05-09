; DESCRIPTION: Creates a orange rectangular region at (103, 151) spanning 69 by 18 pixels.
; PLAN: r0=103(x), r1=151(y), r2=69(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 151
LDI r2, 69
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
