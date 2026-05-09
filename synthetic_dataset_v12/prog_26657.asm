; DESCRIPTION: Creates a white rectangular region at (415, 62) spanning 70 by 49 pixels.
; PLAN: r0=415(x), r1=62(y), r2=70(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 62
LDI r2, 70
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
