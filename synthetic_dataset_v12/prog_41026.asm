; DESCRIPTION: Creates a magenta rectangular region at (66, 206) spanning 78 by 46 pixels.
; PLAN: r0=66(x), r1=206(y), r2=78(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 206
LDI r2, 78
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
