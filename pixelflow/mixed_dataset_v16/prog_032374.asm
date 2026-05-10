; DESCRIPTION: Creates a magenta rectangular region at (225, 106) spanning 19 by 28 pixels.
; PLAN: r0=225(x), r1=106(y), r2=19(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 106
LDI r2, 19
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
