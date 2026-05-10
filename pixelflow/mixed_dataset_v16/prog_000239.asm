; DESCRIPTION: Creates a magenta rectangular region at (38, 93) spanning 82 by 81 pixels.
; PLAN: r0=38(x), r1=93(y), r2=82(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 93
LDI r2, 82
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
