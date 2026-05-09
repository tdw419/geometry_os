; DESCRIPTION: Creates a magenta rectangular region at (27, 105) spanning 104 by 54 pixels.
; PLAN: r0=27(x), r1=105(y), r2=104(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 105
LDI r2, 104
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
