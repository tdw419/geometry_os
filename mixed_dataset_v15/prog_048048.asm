; DESCRIPTION: Creates a orange rectangular region at (422, 76) spanning 26 by 64 pixels.
; PLAN: r0=422(x), r1=76(y), r2=26(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 76
LDI r2, 26
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
