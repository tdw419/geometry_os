; DESCRIPTION: Creates a magenta rectangular region at (27, 189) spanning 84 by 14 pixels.
; PLAN: r0=27(x), r1=189(y), r2=84(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 189
LDI r2, 84
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
