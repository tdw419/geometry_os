; DESCRIPTION: Creates a magenta rectangular region at (65, 166) spanning 76 by 90 pixels.
; PLAN: r0=65(x), r1=166(y), r2=76(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 166
LDI r2, 76
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
