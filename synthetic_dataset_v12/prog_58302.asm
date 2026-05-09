; DESCRIPTION: Creates a blue rectangular region at (90, 236) spanning 94 by 12 pixels.
; PLAN: r0=90(x), r1=236(y), r2=94(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 236
LDI r2, 94
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
