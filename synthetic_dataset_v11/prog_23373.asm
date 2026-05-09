; DESCRIPTION: Creates a magenta rectangular region at (57, 84) spanning 12 by 93 pixels.
; PLAN: r0=57(x), r1=84(y), r2=12(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 84
LDI r2, 12
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
