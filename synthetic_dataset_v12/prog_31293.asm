; DESCRIPTION: Creates a blue rectangular region at (276, 225) spanning 94 by 31 pixels.
; PLAN: r0=276(x), r1=225(y), r2=94(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 225
LDI r2, 94
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
