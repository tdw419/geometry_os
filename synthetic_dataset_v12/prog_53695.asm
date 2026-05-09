; DESCRIPTION: Creates a orange rectangular region at (173, 148) spanning 50 by 77 pixels.
; PLAN: r0=173(x), r1=148(y), r2=50(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 148
LDI r2, 50
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
