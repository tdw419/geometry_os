; DESCRIPTION: Creates a magenta rectangular region at (367, 93) spanning 62 by 118 pixels.
; PLAN: r0=367(x), r1=93(y), r2=62(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 93
LDI r2, 62
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
