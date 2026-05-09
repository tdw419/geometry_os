; DESCRIPTION: Creates a black rectangular region at (64, 195) spanning 75 by 55 pixels.
; PLAN: r0=64(x), r1=195(y), r2=75(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 195
LDI r2, 75
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
