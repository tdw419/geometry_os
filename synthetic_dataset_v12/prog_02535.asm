; DESCRIPTION: Creates a magenta rectangular region at (205, 12) spanning 36 by 104 pixels.
; PLAN: r0=205(x), r1=12(y), r2=36(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 12
LDI r2, 36
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
