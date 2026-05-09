; DESCRIPTION: Creates a green rectangular region at (36, 128) spanning 98 by 96 pixels.
; PLAN: r0=36(x), r1=128(y), r2=98(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 128
LDI r2, 98
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
