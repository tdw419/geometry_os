; DESCRIPTION: Creates a orange rectangular region at (173, 49) spanning 79 by 118 pixels.
; PLAN: r0=173(x), r1=49(y), r2=79(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 49
LDI r2, 79
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
