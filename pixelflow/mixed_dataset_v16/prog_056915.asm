; DESCRIPTION: Creates a white rectangular region at (384, 26) spanning 21 by 40 pixels.
; PLAN: r0=384(x), r1=26(y), r2=21(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 26
LDI r2, 21
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
