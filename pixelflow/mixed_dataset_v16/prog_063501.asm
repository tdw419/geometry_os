; DESCRIPTION: Creates a black rectangular region at (86, 20) spanning 12 by 94 pixels.
; PLAN: r0=86(x), r1=20(y), r2=12(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 20
LDI r2, 12
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
