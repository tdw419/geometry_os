; DESCRIPTION: Creates a white rectangular region at (362, 7) spanning 97 by 102 pixels.
; PLAN: r0=362(x), r1=7(y), r2=97(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 7
LDI r2, 97
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
