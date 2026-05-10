; DESCRIPTION: Creates a blue rectangular region at (329, 19) spanning 44 by 94 pixels.
; PLAN: r0=329(x), r1=19(y), r2=44(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 19
LDI r2, 44
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
