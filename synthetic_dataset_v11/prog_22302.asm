; DESCRIPTION: Creates a yellow rectangular region at (128, 5) spanning 111 by 81 pixels.
; PLAN: r0=128(x), r1=5(y), r2=111(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 5
LDI r2, 111
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
