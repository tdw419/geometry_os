; DESCRIPTION: Creates a magenta rectangular region at (270, 108) spanning 25 by 46 pixels.
; PLAN: r0=270(x), r1=108(y), r2=25(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 108
LDI r2, 25
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
