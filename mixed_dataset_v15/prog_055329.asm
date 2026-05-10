; DESCRIPTION: Creates a black rectangular region at (52, 144) spanning 80 by 32 pixels.
; PLAN: r0=52(x), r1=144(y), r2=80(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 144
LDI r2, 80
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
