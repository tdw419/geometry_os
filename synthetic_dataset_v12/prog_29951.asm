; DESCRIPTION: Creates a magenta rectangular region at (65, 174) spanning 94 by 66 pixels.
; PLAN: r0=65(x), r1=174(y), r2=94(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 174
LDI r2, 94
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
