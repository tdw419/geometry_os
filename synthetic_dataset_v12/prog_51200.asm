; DESCRIPTION: Creates a magenta rectangular region at (87, 138) spanning 36 by 39 pixels.
; PLAN: r0=87(x), r1=138(y), r2=36(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 138
LDI r2, 36
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
