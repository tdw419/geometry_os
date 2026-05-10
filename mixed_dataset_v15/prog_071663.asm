; DESCRIPTION: Creates a black rectangular region at (205, 28) spanning 94 by 98 pixels.
; PLAN: r0=205(x), r1=28(y), r2=94(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 28
LDI r2, 94
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
