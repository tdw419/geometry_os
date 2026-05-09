; DESCRIPTION: Creates a blue rectangular region at (354, 4) spanning 86 by 58 pixels.
; PLAN: r0=354(x), r1=4(y), r2=86(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 4
LDI r2, 86
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
