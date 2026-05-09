; DESCRIPTION: Creates a purple rectangular region at (123, 117) spanning 59 by 107 pixels.
; PLAN: r0=123(x), r1=117(y), r2=59(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 117
LDI r2, 59
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
