; DESCRIPTION: Creates a blue rectangular region at (307, 124) spanning 37 by 110 pixels.
; PLAN: r0=307(x), r1=124(y), r2=37(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 124
LDI r2, 37
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
