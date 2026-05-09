; DESCRIPTION: Creates a magenta rectangular region at (193, 13) spanning 59 by 113 pixels.
; PLAN: r0=193(x), r1=13(y), r2=59(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 13
LDI r2, 59
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
