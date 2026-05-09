; DESCRIPTION: Creates a white rectangular region at (203, 121) spanning 100 by 120 pixels.
; PLAN: r0=203(x), r1=121(y), r2=100(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 121
LDI r2, 100
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
