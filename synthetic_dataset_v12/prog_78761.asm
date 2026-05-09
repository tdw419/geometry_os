; DESCRIPTION: Creates a magenta rectangular region at (406, 55) spanning 15 by 39 pixels.
; PLAN: r0=406(x), r1=55(y), r2=15(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 55
LDI r2, 15
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
