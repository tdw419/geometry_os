; DESCRIPTION: Creates a white rectangular region at (50, 184) spanning 100 by 36 pixels.
; PLAN: r0=50(x), r1=184(y), r2=100(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 184
LDI r2, 100
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
