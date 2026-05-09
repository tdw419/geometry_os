; DESCRIPTION: Creates a red rectangular region at (137, 68) spanning 84 by 11 pixels.
; PLAN: r0=137(x), r1=68(y), r2=84(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 68
LDI r2, 84
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
