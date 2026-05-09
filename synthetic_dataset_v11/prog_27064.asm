; DESCRIPTION: Creates a white rectangular region at (25, 163) spanning 58 by 84 pixels.
; PLAN: r0=25(x), r1=163(y), r2=58(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 163
LDI r2, 58
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
