; DESCRIPTION: Creates a purple rectangular region at (129, 27) spanning 22 by 111 pixels.
; PLAN: r0=129(x), r1=27(y), r2=22(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 27
LDI r2, 22
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
