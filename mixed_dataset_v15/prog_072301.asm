; DESCRIPTION: Creates a purple rectangular region at (240, 104) spanning 113 by 28 pixels.
; PLAN: r0=240(x), r1=104(y), r2=113(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 104
LDI r2, 113
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
