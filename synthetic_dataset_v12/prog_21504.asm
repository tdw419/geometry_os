; DESCRIPTION: Creates a purple rectangular region at (14, 134) spanning 113 by 107 pixels.
; PLAN: r0=14(x), r1=134(y), r2=113(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 134
LDI r2, 113
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
