; DESCRIPTION: Creates a magenta rectangular region at (276, 71) spanning 108 by 17 pixels.
; PLAN: r0=276(x), r1=71(y), r2=108(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 71
LDI r2, 108
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
