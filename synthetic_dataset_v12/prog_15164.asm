; DESCRIPTION: Creates a blue rectangular region at (212, 37) spanning 23 by 92 pixels.
; PLAN: r0=212(x), r1=37(y), r2=23(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 37
LDI r2, 23
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
