; DESCRIPTION: Creates a green rectangular region at (378, 7) spanning 74 by 107 pixels.
; PLAN: r0=378(x), r1=7(y), r2=74(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 7
LDI r2, 74
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
