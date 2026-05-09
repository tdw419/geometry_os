; DESCRIPTION: Creates a magenta rectangular region at (171, 171) spanning 27 by 24 pixels.
; PLAN: r0=171(x), r1=171(y), r2=27(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 171
LDI r2, 27
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
