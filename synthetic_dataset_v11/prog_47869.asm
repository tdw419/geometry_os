; DESCRIPTION: Creates a magenta rectangular region at (27, 143) spanning 15 by 105 pixels.
; PLAN: r0=27(x), r1=143(y), r2=15(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 143
LDI r2, 15
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
