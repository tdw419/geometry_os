; DESCRIPTION: Creates a magenta rectangular region at (151, 93) spanning 58 by 111 pixels.
; PLAN: r0=151(x), r1=93(y), r2=58(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 93
LDI r2, 58
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
