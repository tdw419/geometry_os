; DESCRIPTION: Creates a yellow rectangular region at (278, 128) spanning 57 by 113 pixels.
; PLAN: r0=278(x), r1=128(y), r2=57(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 128
LDI r2, 57
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
