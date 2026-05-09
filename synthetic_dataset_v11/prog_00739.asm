; DESCRIPTION: Creates a white rectangular region at (82, 4) spanning 30 by 73 pixels.
; PLAN: r0=82(x), r1=4(y), r2=30(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 4
LDI r2, 30
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
