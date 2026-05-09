; DESCRIPTION: Creates a yellow rectangular region at (64, 4) spanning 74 by 12 pixels.
; PLAN: r0=64(x), r1=4(y), r2=74(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 4
LDI r2, 74
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
