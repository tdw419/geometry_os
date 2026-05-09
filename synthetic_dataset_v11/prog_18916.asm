; DESCRIPTION: Creates a magenta rectangular region at (73, 44) spanning 105 by 98 pixels.
; PLAN: r0=73(x), r1=44(y), r2=105(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 44
LDI r2, 105
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
