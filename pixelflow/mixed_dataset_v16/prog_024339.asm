; DESCRIPTION: Creates a purple rectangular region at (327, 117) spanning 106 by 58 pixels.
; PLAN: r0=327(x), r1=117(y), r2=106(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 117
LDI r2, 106
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
