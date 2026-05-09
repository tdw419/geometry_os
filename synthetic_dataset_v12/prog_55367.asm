; DESCRIPTION: Creates a magenta rectangular region at (52, 156) spanning 27 by 16 pixels.
; PLAN: r0=52(x), r1=156(y), r2=27(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 156
LDI r2, 27
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
