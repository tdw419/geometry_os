; DESCRIPTION: Creates a yellow rectangular region at (7, 10) spanning 19 by 64 pixels.
; PLAN: r0=7(x), r1=10(y), r2=19(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 10
LDI r2, 19
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
