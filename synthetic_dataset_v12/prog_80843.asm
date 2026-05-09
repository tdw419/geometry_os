; DESCRIPTION: Creates a black rectangular region at (442, 54) spanning 39 by 32 pixels.
; PLAN: r0=442(x), r1=54(y), r2=39(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 54
LDI r2, 39
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
