; DESCRIPTION: Creates a black rectangular region at (275, 56) spanning 89 by 120 pixels.
; PLAN: r0=275(x), r1=56(y), r2=89(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 56
LDI r2, 89
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
