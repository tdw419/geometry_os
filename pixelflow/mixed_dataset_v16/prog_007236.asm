; DESCRIPTION: Creates a orange rectangular region at (419, 32) spanning 17 by 15 pixels.
; PLAN: r0=419(x), r1=32(y), r2=17(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 32
LDI r2, 17
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
