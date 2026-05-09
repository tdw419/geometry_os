; DESCRIPTION: Creates a magenta rectangular region at (46, 233) spanning 89 by 17 pixels.
; PLAN: r0=46(x), r1=233(y), r2=89(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 233
LDI r2, 89
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
