; DESCRIPTION: Creates a yellow rectangular region at (8, 143) spanning 28 by 36 pixels.
; PLAN: r0=8(x), r1=143(y), r2=28(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 143
LDI r2, 28
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
