; DESCRIPTION: Creates a purple rectangular region at (198, 124) spanning 105 by 79 pixels.
; PLAN: r0=198(x), r1=124(y), r2=105(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 124
LDI r2, 105
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
