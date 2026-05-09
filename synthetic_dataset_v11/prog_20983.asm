; DESCRIPTION: Creates a white rectangular region at (105, 193) spanning 76 by 54 pixels.
; PLAN: r0=105(x), r1=193(y), r2=76(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 193
LDI r2, 76
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
