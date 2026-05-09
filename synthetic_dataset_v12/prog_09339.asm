; DESCRIPTION: Creates a black rectangular region at (269, 64) spanning 110 by 77 pixels.
; PLAN: r0=269(x), r1=64(y), r2=110(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 64
LDI r2, 110
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
