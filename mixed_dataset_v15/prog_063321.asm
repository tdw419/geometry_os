; DESCRIPTION: Creates a white rectangular region at (146, 184) spanning 76 by 64 pixels.
; PLAN: r0=146(x), r1=184(y), r2=76(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 184
LDI r2, 76
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
