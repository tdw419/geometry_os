; DESCRIPTION: Creates a white rectangular region at (360, 3) spanning 88 by 50 pixels.
; PLAN: r0=360(x), r1=3(y), r2=88(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 3
LDI r2, 88
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
