; DESCRIPTION: Creates a magenta rectangular region at (66, 135) spanning 98 by 77 pixels.
; PLAN: r0=66(x), r1=135(y), r2=98(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 135
LDI r2, 98
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
