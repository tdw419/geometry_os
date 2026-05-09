; DESCRIPTION: Creates a white rectangular region at (5, 120) spanning 100 by 43 pixels.
; PLAN: r0=5(x), r1=120(y), r2=100(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 120
LDI r2, 100
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
