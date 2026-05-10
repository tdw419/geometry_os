; DESCRIPTION: Creates a purple rectangular region at (164, 117) spanning 60 by 56 pixels.
; PLAN: r0=164(x), r1=117(y), r2=60(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 117
LDI r2, 60
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
