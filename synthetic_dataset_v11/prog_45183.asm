; DESCRIPTION: Creates a black rectangular region at (132, 159) spanning 64 by 75 pixels.
; PLAN: r0=132(x), r1=159(y), r2=64(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 159
LDI r2, 64
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
