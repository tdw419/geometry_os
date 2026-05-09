; DESCRIPTION: Creates a blue rectangular region at (293, 9) spanning 94 by 87 pixels.
; PLAN: r0=293(x), r1=9(y), r2=94(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 9
LDI r2, 94
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
