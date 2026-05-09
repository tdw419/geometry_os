; DESCRIPTION: Creates a magenta rectangular region at (151, 96) spanning 46 by 27 pixels.
; PLAN: r0=151(x), r1=96(y), r2=46(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 96
LDI r2, 46
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
