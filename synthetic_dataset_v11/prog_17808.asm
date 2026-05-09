; DESCRIPTION: Creates a yellow rectangular region at (94, 27) spanning 74 by 105 pixels.
; PLAN: r0=94(x), r1=27(y), r2=74(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 27
LDI r2, 74
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
