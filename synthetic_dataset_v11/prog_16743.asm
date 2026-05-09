; DESCRIPTION: Creates a black rectangular region at (8, 32) spanning 47 by 60 pixels.
; PLAN: r0=8(x), r1=32(y), r2=47(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 32
LDI r2, 47
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
