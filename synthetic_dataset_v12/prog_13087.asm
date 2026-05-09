; DESCRIPTION: Creates a magenta rectangular region at (7, 171) spanning 108 by 42 pixels.
; PLAN: r0=7(x), r1=171(y), r2=108(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 171
LDI r2, 108
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
