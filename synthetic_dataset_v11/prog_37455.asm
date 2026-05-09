; DESCRIPTION: Creates a yellow rectangular region at (127, 113) spanning 110 by 45 pixels.
; PLAN: r0=127(x), r1=113(y), r2=110(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 113
LDI r2, 110
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
