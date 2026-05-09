; DESCRIPTION: Creates a orange rectangular region at (173, 112) spanning 23 by 91 pixels.
; PLAN: r0=173(x), r1=112(y), r2=23(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 112
LDI r2, 23
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
