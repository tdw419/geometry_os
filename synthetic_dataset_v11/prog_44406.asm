; DESCRIPTION: Creates a white rectangular region at (204, 76) spanning 20 by 58 pixels.
; PLAN: r0=204(x), r1=76(y), r2=20(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 76
LDI r2, 20
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
