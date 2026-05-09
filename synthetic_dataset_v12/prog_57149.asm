; DESCRIPTION: Creates a magenta rectangular region at (372, 175) spanning 96 by 72 pixels.
; PLAN: r0=372(x), r1=175(y), r2=96(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 175
LDI r2, 96
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
