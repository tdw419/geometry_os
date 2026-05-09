; DESCRIPTION: Creates a yellow rectangular region at (281, 153) spanning 49 by 64 pixels.
; PLAN: r0=281(x), r1=153(y), r2=49(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 153
LDI r2, 49
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
