; DESCRIPTION: Creates a blue rectangular region at (107, 94) spanning 107 by 111 pixels.
; PLAN: r0=107(x), r1=94(y), r2=107(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 94
LDI r2, 107
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
