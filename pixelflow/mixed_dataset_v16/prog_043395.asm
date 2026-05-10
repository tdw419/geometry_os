; DESCRIPTION: Creates a magenta rectangular region at (9, 11) spanning 87 by 117 pixels.
; PLAN: r0=9(x), r1=11(y), r2=87(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 11
LDI r2, 87
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
