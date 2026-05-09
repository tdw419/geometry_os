; DESCRIPTION: Creates a white rectangular region at (259, 105) spanning 120 by 58 pixels.
; PLAN: r0=259(x), r1=105(y), r2=120(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 105
LDI r2, 120
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
