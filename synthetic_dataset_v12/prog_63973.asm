; DESCRIPTION: Creates a magenta rectangular region at (201, 151) spanning 14 by 59 pixels.
; PLAN: r0=201(x), r1=151(y), r2=14(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 151
LDI r2, 14
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
