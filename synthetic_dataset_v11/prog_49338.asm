; DESCRIPTION: Creates a orange rectangular region at (113, 1) spanning 55 by 119 pixels.
; PLAN: r0=113(x), r1=1(y), r2=55(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 1
LDI r2, 55
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
