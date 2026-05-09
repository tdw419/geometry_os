; DESCRIPTION: Creates a purple rectangular region at (149, 117) spanning 103 by 96 pixels.
; PLAN: r0=149(x), r1=117(y), r2=103(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 117
LDI r2, 103
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
