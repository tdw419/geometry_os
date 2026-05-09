; DESCRIPTION: Creates a magenta rectangular region at (59, 159) spanning 73 by 27 pixels.
; PLAN: r0=59(x), r1=159(y), r2=73(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 159
LDI r2, 73
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
