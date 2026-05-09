; DESCRIPTION: Creates a magenta rectangular region at (82, 134) spanning 112 by 115 pixels.
; PLAN: r0=82(x), r1=134(y), r2=112(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 134
LDI r2, 112
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
