; DESCRIPTION: Creates a magenta rectangular region at (188, 73) spanning 109 by 60 pixels.
; PLAN: r0=188(x), r1=73(y), r2=109(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 73
LDI r2, 109
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
