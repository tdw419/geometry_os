; DESCRIPTION: Creates a white rectangular region at (324, 39) spanning 10 by 84 pixels.
; PLAN: r0=324(x), r1=39(y), r2=10(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 39
LDI r2, 10
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
