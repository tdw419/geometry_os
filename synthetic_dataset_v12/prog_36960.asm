; DESCRIPTION: Creates a purple rectangular region at (196, 19) spanning 100 by 117 pixels.
; PLAN: r0=196(x), r1=19(y), r2=100(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 19
LDI r2, 100
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
