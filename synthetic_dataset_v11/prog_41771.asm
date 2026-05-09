; DESCRIPTION: Creates a magenta rectangular region at (40, 117) spanning 99 by 33 pixels.
; PLAN: r0=40(x), r1=117(y), r2=99(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 117
LDI r2, 99
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
