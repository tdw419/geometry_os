; DESCRIPTION: Creates a magenta rectangular region at (373, 109) spanning 19 by 94 pixels.
; PLAN: r0=373(x), r1=109(y), r2=19(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 109
LDI r2, 19
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
