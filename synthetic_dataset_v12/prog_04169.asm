; DESCRIPTION: Creates a magenta rectangular region at (20, 126) spanning 116 by 93 pixels.
; PLAN: r0=20(x), r1=126(y), r2=116(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 126
LDI r2, 116
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
