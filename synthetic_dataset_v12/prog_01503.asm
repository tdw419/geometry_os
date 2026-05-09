; DESCRIPTION: Creates a magenta rectangular region at (243, 5) spanning 54 by 78 pixels.
; PLAN: r0=243(x), r1=5(y), r2=54(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 5
LDI r2, 54
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
