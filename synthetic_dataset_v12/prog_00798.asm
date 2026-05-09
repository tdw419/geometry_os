; DESCRIPTION: Creates a magenta rectangular region at (181, 57) spanning 59 by 111 pixels.
; PLAN: r0=181(x), r1=57(y), r2=59(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 57
LDI r2, 59
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
