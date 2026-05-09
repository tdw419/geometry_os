; DESCRIPTION: Creates a white rectangular region at (149, 34) spanning 64 by 104 pixels.
; PLAN: r0=149(x), r1=34(y), r2=64(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 34
LDI r2, 64
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
