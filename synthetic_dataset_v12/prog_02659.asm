; DESCRIPTION: Creates a magenta rectangular region at (319, 65) spanning 98 by 77 pixels.
; PLAN: r0=319(x), r1=65(y), r2=98(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 65
LDI r2, 98
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
