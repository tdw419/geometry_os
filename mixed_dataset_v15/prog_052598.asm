; DESCRIPTION: Creates a purple rectangular region at (264, 106) spanning 99 by 117 pixels.
; PLAN: r0=264(x), r1=106(y), r2=99(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 106
LDI r2, 99
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
