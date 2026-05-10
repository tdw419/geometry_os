; DESCRIPTION: Creates a magenta rectangular region at (253, 27) spanning 74 by 26 pixels.
; PLAN: r0=253(x), r1=27(y), r2=74(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 27
LDI r2, 74
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
