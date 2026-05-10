; DESCRIPTION: Creates a yellow rectangular region at (16, 73) spanning 101 by 18 pixels.
; PLAN: r0=16(x), r1=73(y), r2=101(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 73
LDI r2, 101
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
