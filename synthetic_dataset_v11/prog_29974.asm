; DESCRIPTION: Creates a blue rectangular region at (23, 71) spanning 14 by 98 pixels.
; PLAN: r0=23(x), r1=71(y), r2=14(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 71
LDI r2, 14
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
