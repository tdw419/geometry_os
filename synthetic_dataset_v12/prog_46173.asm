; DESCRIPTION: Creates a orange rectangular region at (352, 173) spanning 101 by 45 pixels.
; PLAN: r0=352(x), r1=173(y), r2=101(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 173
LDI r2, 101
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
