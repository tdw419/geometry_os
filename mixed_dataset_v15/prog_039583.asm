; DESCRIPTION: Creates a magenta rectangular region at (373, 138) spanning 12 by 103 pixels.
; PLAN: r0=373(x), r1=138(y), r2=12(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 138
LDI r2, 12
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
