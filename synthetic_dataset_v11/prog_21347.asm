; DESCRIPTION: Creates a blue rectangular region at (73, 94) spanning 98 by 57 pixels.
; PLAN: r0=73(x), r1=94(y), r2=98(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 94
LDI r2, 98
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
