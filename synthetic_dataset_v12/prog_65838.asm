; DESCRIPTION: Creates a magenta rectangular region at (288, 13) spanning 26 by 105 pixels.
; PLAN: r0=288(x), r1=13(y), r2=26(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 13
LDI r2, 26
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
