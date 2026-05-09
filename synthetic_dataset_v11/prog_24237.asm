; DESCRIPTION: Creates a white rectangular region at (219, 38) spanning 37 by 87 pixels.
; PLAN: r0=219(x), r1=38(y), r2=37(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 38
LDI r2, 37
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
