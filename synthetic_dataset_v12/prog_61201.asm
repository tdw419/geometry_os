; DESCRIPTION: Creates a orange rectangular region at (418, 124) spanning 84 by 10 pixels.
; PLAN: r0=418(x), r1=124(y), r2=84(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 124
LDI r2, 84
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
