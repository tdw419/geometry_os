; DESCRIPTION: Creates a magenta rectangular region at (491, 115) spanning 13 by 60 pixels.
; PLAN: r0=491(x), r1=115(y), r2=13(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 115
LDI r2, 13
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
