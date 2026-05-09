; DESCRIPTION: Creates a magenta rectangular region at (185, 15) spanning 85 by 59 pixels.
; PLAN: r0=185(x), r1=15(y), r2=85(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 15
LDI r2, 85
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
