; DESCRIPTION: Creates a magenta rectangular region at (42, 9) spanning 51 by 100 pixels.
; PLAN: r0=42(x), r1=9(y), r2=51(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 9
LDI r2, 51
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
