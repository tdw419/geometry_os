; DESCRIPTION: Creates a white rectangular region at (327, 135) spanning 110 by 116 pixels.
; PLAN: r0=327(x), r1=135(y), r2=110(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 135
LDI r2, 110
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
