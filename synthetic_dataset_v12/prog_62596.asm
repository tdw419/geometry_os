; DESCRIPTION: Creates a white rectangular region at (48, 184) spanning 101 by 38 pixels.
; PLAN: r0=48(x), r1=184(y), r2=101(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 184
LDI r2, 101
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
