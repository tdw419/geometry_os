; DESCRIPTION: Creates a orange rectangular region at (69, 153) spanning 35 by 27 pixels.
; PLAN: r0=69(x), r1=153(y), r2=35(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 153
LDI r2, 35
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
