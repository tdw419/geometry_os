; DESCRIPTION: Creates a orange rectangular region at (88, 111) spanning 80 by 49 pixels.
; PLAN: r0=88(x), r1=111(y), r2=80(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 111
LDI r2, 80
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
