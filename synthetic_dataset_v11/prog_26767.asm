; DESCRIPTION: Creates a magenta rectangular region at (40, 4) spanning 59 by 13 pixels.
; PLAN: r0=40(x), r1=4(y), r2=59(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 4
LDI r2, 59
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
