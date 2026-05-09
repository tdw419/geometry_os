; DESCRIPTION: Creates a magenta rectangular region at (33, 175) spanning 46 by 80 pixels.
; PLAN: r0=33(x), r1=175(y), r2=46(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 175
LDI r2, 46
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
