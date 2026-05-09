; DESCRIPTION: Creates a orange rectangular region at (17, 0) spanning 91 by 81 pixels.
; PLAN: r0=17(x), r1=0(y), r2=91(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 0
LDI r2, 91
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
