; DESCRIPTION: Creates a magenta rectangular region at (125, 73) spanning 90 by 63 pixels.
; PLAN: r0=125(x), r1=73(y), r2=90(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 73
LDI r2, 90
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
