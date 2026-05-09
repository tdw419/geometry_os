; DESCRIPTION: Creates a red rectangular region at (80, 56) spanning 49 by 84 pixels.
; PLAN: r0=80(x), r1=56(y), r2=49(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 56
LDI r2, 49
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
