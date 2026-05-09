; DESCRIPTION: Creates a yellow rectangular region at (7, 39) spanning 64 by 32 pixels.
; PLAN: r0=7(x), r1=39(y), r2=64(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 39
LDI r2, 64
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
