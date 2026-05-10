; DESCRIPTION: Creates a magenta rectangular region at (473, 163) spanning 36 by 18 pixels.
; PLAN: r0=473(x), r1=163(y), r2=36(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 163
LDI r2, 36
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
