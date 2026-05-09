; DESCRIPTION: Creates a yellow rectangular region at (218, 96) spanning 12 by 32 pixels.
; PLAN: r0=218(x), r1=96(y), r2=12(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 96
LDI r2, 12
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
