; DESCRIPTION: Creates a blue rectangular region at (198, 125) spanning 33 by 78 pixels.
; PLAN: r0=198(x), r1=125(y), r2=33(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 125
LDI r2, 33
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
