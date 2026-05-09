; DESCRIPTION: Creates a magenta rectangular region at (61, 78) spanning 120 by 65 pixels.
; PLAN: r0=61(x), r1=78(y), r2=120(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 78
LDI r2, 120
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
