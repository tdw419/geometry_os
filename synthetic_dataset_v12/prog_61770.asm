; DESCRIPTION: Creates a green rectangular region at (74, 108) spanning 107 by 28 pixels.
; PLAN: r0=74(x), r1=108(y), r2=107(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 108
LDI r2, 107
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
