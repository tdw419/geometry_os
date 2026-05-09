; DESCRIPTION: Creates a red rectangular region at (33, 148) spanning 84 by 13 pixels.
; PLAN: r0=33(x), r1=148(y), r2=84(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 148
LDI r2, 84
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
