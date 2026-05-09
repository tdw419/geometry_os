; DESCRIPTION: Creates a magenta rectangular region at (425, 144) spanning 86 by 11 pixels.
; PLAN: r0=425(x), r1=144(y), r2=86(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 144
LDI r2, 86
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
