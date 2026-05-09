; DESCRIPTION: Creates a white rectangular region at (310, 111) spanning 108 by 70 pixels.
; PLAN: r0=310(x), r1=111(y), r2=108(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 111
LDI r2, 108
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
