; DESCRIPTION: Creates a blue rectangular region at (127, 12) spanning 117 by 44 pixels.
; PLAN: r0=127(x), r1=12(y), r2=117(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 12
LDI r2, 117
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
