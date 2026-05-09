; DESCRIPTION: Creates a white rectangular region at (386, 93) spanning 116 by 76 pixels.
; PLAN: r0=386(x), r1=93(y), r2=116(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 93
LDI r2, 116
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
