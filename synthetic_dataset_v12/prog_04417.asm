; DESCRIPTION: Creates a magenta rectangular region at (304, 142) spanning 21 by 52 pixels.
; PLAN: r0=304(x), r1=142(y), r2=21(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 142
LDI r2, 21
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
