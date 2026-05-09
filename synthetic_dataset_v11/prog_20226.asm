; DESCRIPTION: Creates a magenta rectangular region at (139, 53) spanning 109 by 93 pixels.
; PLAN: r0=139(x), r1=53(y), r2=109(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 53
LDI r2, 109
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
