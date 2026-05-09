; DESCRIPTION: Creates a red rectangular region at (266, 219) spanning 84 by 25 pixels.
; PLAN: r0=266(x), r1=219(y), r2=84(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 219
LDI r2, 84
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
