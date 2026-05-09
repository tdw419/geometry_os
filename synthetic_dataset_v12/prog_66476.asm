; DESCRIPTION: Creates a magenta rectangular region at (120, 160) spanning 21 by 54 pixels.
; PLAN: r0=120(x), r1=160(y), r2=21(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 160
LDI r2, 21
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
