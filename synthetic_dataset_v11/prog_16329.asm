; DESCRIPTION: Creates a black rectangular region at (77, 32) spanning 27 by 39 pixels.
; PLAN: r0=77(x), r1=32(y), r2=27(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 32
LDI r2, 27
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
