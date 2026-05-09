; DESCRIPTION: Creates a magenta rectangular region at (7, 17) spanning 65 by 80 pixels.
; PLAN: r0=7(x), r1=17(y), r2=65(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 17
LDI r2, 65
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
