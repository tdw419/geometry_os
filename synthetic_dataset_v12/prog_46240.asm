; DESCRIPTION: Creates a magenta rectangular region at (84, 211) spanning 65 by 17 pixels.
; PLAN: r0=84(x), r1=211(y), r2=65(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 211
LDI r2, 65
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
