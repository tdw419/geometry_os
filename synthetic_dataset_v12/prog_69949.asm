; DESCRIPTION: Creates a magenta rectangular region at (420, 205) spanning 61 by 17 pixels.
; PLAN: r0=420(x), r1=205(y), r2=61(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 205
LDI r2, 61
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
