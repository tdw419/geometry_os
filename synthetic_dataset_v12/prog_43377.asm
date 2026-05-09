; DESCRIPTION: Creates a magenta rectangular region at (112, 82) spanning 18 by 68 pixels.
; PLAN: r0=112(x), r1=82(y), r2=18(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 82
LDI r2, 18
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
