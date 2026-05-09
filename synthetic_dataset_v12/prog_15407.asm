; DESCRIPTION: Creates a white rectangular region at (5, 93) spanning 33 by 73 pixels.
; PLAN: r0=5(x), r1=93(y), r2=33(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 93
LDI r2, 33
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
