; DESCRIPTION: Creates a magenta rectangular region at (59, 10) spanning 39 by 113 pixels.
; PLAN: r0=59(x), r1=10(y), r2=39(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 10
LDI r2, 39
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
