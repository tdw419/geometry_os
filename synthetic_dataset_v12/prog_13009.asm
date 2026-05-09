; DESCRIPTION: Creates a magenta rectangular region at (73, 213) spanning 37 by 29 pixels.
; PLAN: r0=73(x), r1=213(y), r2=37(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 213
LDI r2, 37
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
