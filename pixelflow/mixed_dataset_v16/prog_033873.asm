; DESCRIPTION: Creates a magenta rectangular region at (98, 11) spanning 113 by 54 pixels.
; PLAN: r0=98(x), r1=11(y), r2=113(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 11
LDI r2, 113
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
