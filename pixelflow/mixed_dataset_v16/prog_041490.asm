; DESCRIPTION: Creates a magenta rectangular region at (20, 74) spanning 27 by 47 pixels.
; PLAN: r0=20(x), r1=74(y), r2=27(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 74
LDI r2, 27
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
