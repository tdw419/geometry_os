; DESCRIPTION: Creates a white rectangular region at (39, 154) spanning 83 by 49 pixels.
; PLAN: r0=39(x), r1=154(y), r2=83(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 154
LDI r2, 83
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
