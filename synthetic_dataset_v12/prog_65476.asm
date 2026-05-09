; DESCRIPTION: Creates a black rectangular region at (222, 11) spanning 77 by 32 pixels.
; PLAN: r0=222(x), r1=11(y), r2=77(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 11
LDI r2, 77
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
