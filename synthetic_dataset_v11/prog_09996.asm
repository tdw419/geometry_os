; DESCRIPTION: Creates a orange rectangular region at (171, 96) spanning 64 by 119 pixels.
; PLAN: r0=171(x), r1=96(y), r2=64(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 96
LDI r2, 64
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
