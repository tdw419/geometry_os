; DESCRIPTION: Creates a white rectangular region at (17, 180) spanning 100 by 64 pixels.
; PLAN: r0=17(x), r1=180(y), r2=100(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 180
LDI r2, 100
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
