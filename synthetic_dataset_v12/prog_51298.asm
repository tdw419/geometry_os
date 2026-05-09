; DESCRIPTION: Creates a magenta rectangular region at (372, 70) spanning 89 by 86 pixels.
; PLAN: r0=372(x), r1=70(y), r2=89(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 70
LDI r2, 89
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
