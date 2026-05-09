; DESCRIPTION: Creates a yellow rectangular region at (128, 11) spanning 39 by 77 pixels.
; PLAN: r0=128(x), r1=11(y), r2=39(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 11
LDI r2, 39
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
