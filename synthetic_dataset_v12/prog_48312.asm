; DESCRIPTION: Creates a black rectangular region at (372, 0) spanning 84 by 68 pixels.
; PLAN: r0=372(x), r1=0(y), r2=84(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 0
LDI r2, 84
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
