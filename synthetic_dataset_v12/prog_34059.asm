; DESCRIPTION: Creates a orange rectangular region at (367, 64) spanning 11 by 113 pixels.
; PLAN: r0=367(x), r1=64(y), r2=11(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 64
LDI r2, 11
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
