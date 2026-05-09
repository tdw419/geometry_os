; DESCRIPTION: Creates a magenta rectangular region at (21, 5) spanning 57 by 37 pixels.
; PLAN: r0=21(x), r1=5(y), r2=57(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 5
LDI r2, 57
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
