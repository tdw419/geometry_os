; DESCRIPTION: Creates a magenta rectangular region at (140, 55) spanning 28 by 46 pixels.
; PLAN: r0=140(x), r1=55(y), r2=28(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 55
LDI r2, 28
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
