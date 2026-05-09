; DESCRIPTION: Creates a magenta rectangular region at (98, 16) spanning 66 by 25 pixels.
; PLAN: r0=98(x), r1=16(y), r2=66(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 16
LDI r2, 66
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
