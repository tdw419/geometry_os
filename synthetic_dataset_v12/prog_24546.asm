; DESCRIPTION: Creates a white rectangular region at (310, 59) spanning 11 by 21 pixels.
; PLAN: r0=310(x), r1=59(y), r2=11(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 59
LDI r2, 11
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
