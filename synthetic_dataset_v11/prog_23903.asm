; DESCRIPTION: Creates a purple rectangular region at (72, 149) spanning 120 by 105 pixels.
; PLAN: r0=72(x), r1=149(y), r2=120(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 149
LDI r2, 120
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
