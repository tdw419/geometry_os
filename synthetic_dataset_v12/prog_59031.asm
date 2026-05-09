; DESCRIPTION: Creates a magenta rectangular region at (86, 83) spanning 115 by 37 pixels.
; PLAN: r0=86(x), r1=83(y), r2=115(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 83
LDI r2, 115
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
