; DESCRIPTION: Creates a orange rectangular region at (210, 173) spanning 40 by 73 pixels.
; PLAN: r0=210(x), r1=173(y), r2=40(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 173
LDI r2, 40
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
