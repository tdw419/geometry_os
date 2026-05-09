; DESCRIPTION: Creates a magenta rectangular region at (65, 93) spanning 107 by 69 pixels.
; PLAN: r0=65(x), r1=93(y), r2=107(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 93
LDI r2, 107
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
