; DESCRIPTION: Creates a magenta rectangular region at (359, 10) spanning 27 by 40 pixels.
; PLAN: r0=359(x), r1=10(y), r2=27(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 10
LDI r2, 27
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
