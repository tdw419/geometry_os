; DESCRIPTION: Creates a orange rectangular region at (13, 40) spanning 112 by 113 pixels.
; PLAN: r0=13(x), r1=40(y), r2=112(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 40
LDI r2, 112
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
