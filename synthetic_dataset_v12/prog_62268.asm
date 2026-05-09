; DESCRIPTION: Creates a white rectangular region at (403, 52) spanning 52 by 100 pixels.
; PLAN: r0=403(x), r1=52(y), r2=52(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 52
LDI r2, 52
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
