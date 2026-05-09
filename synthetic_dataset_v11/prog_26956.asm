; DESCRIPTION: Creates a magenta rectangular region at (81, 173) spanning 12 by 74 pixels.
; PLAN: r0=81(x), r1=173(y), r2=12(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 173
LDI r2, 12
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
