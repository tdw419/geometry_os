; DESCRIPTION: Creates a orange rectangular region at (84, 244) spanning 50 by 11 pixels.
; PLAN: r0=84(x), r1=244(y), r2=50(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 244
LDI r2, 50
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
