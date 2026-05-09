; DESCRIPTION: Creates a green rectangular region at (415, 18) spanning 97 by 53 pixels.
; PLAN: r0=415(x), r1=18(y), r2=97(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 18
LDI r2, 97
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
