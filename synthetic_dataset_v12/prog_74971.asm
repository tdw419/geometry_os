; DESCRIPTION: Creates a magenta rectangular region at (172, 193) spanning 15 by 24 pixels.
; PLAN: r0=172(x), r1=193(y), r2=15(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 193
LDI r2, 15
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
