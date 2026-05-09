; DESCRIPTION: Creates a white rectangular region at (44, 180) spanning 83 by 21 pixels.
; PLAN: r0=44(x), r1=180(y), r2=83(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 180
LDI r2, 83
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
