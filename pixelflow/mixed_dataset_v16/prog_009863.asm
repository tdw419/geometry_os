; DESCRIPTION: Creates a magenta rectangular region at (306, 89) spanning 93 by 65 pixels.
; PLAN: r0=306(x), r1=89(y), r2=93(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 89
LDI r2, 93
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
