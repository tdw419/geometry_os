; DESCRIPTION: Creates a white rectangular region at (204, 61) spanning 70 by 87 pixels.
; PLAN: r0=204(x), r1=61(y), r2=70(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 61
LDI r2, 70
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
