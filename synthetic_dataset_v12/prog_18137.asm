; DESCRIPTION: Creates a white rectangular region at (172, 180) spanning 52 by 38 pixels.
; PLAN: r0=172(x), r1=180(y), r2=52(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 180
LDI r2, 52
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
