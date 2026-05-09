; DESCRIPTION: Creates a purple rectangular region at (307, 79) spanning 104 by 70 pixels.
; PLAN: r0=307(x), r1=79(y), r2=104(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 79
LDI r2, 104
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
