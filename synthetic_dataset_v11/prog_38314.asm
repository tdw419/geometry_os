; DESCRIPTION: Creates a white rectangular region at (151, 214) spanning 96 by 38 pixels.
; PLAN: r0=151(x), r1=214(y), r2=96(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 214
LDI r2, 96
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
