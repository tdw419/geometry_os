; DESCRIPTION: Creates a magenta rectangular region at (217, 74) spanning 93 by 10 pixels.
; PLAN: r0=217(x), r1=74(y), r2=93(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 74
LDI r2, 93
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
