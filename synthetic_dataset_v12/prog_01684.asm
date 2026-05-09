; DESCRIPTION: Creates a white rectangular region at (372, 222) spanning 62 by 13 pixels.
; PLAN: r0=372(x), r1=222(y), r2=62(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 222
LDI r2, 62
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
