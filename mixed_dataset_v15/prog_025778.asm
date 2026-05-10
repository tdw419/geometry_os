; DESCRIPTION: Creates a magenta rectangular region at (200, 151) spanning 109 by 65 pixels.
; PLAN: r0=200(x), r1=151(y), r2=109(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 151
LDI r2, 109
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
