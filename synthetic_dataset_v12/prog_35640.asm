; DESCRIPTION: Creates a purple rectangular region at (238, 134) spanning 113 by 104 pixels.
; PLAN: r0=238(x), r1=134(y), r2=113(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 134
LDI r2, 113
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
