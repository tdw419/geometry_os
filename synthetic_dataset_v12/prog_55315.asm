; DESCRIPTION: Creates a white rectangular region at (170, 213) spanning 94 by 33 pixels.
; PLAN: r0=170(x), r1=213(y), r2=94(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 213
LDI r2, 94
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
