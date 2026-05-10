; DESCRIPTION: Creates a blue rectangular region at (172, 86) spanning 77 by 70 pixels.
; PLAN: r0=172(x), r1=86(y), r2=77(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 86
LDI r2, 77
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
