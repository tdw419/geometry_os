; DESCRIPTION: Creates a orange rectangular region at (135, 126) spanning 18 by 78 pixels.
; PLAN: r0=135(x), r1=126(y), r2=18(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 126
LDI r2, 18
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
