; DESCRIPTION: Creates a orange rectangular region at (12, 135) spanning 59 by 105 pixels.
; PLAN: r0=12(x), r1=135(y), r2=59(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 135
LDI r2, 59
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
