; DESCRIPTION: Creates a white rectangular region at (210, 48) spanning 14 by 78 pixels.
; PLAN: r0=210(x), r1=48(y), r2=14(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 48
LDI r2, 14
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
