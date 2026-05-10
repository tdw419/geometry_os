; DESCRIPTION: Creates a white rectangular region at (119, 205) spanning 73 by 48 pixels.
; PLAN: r0=119(x), r1=205(y), r2=73(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 205
LDI r2, 73
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
