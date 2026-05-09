; DESCRIPTION: Creates a magenta rectangular region at (208, 105) spanning 110 by 111 pixels.
; PLAN: r0=208(x), r1=105(y), r2=110(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 105
LDI r2, 110
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
