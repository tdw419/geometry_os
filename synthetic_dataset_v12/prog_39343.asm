; DESCRIPTION: Creates a green rectangular region at (359, 215) spanning 107 by 19 pixels.
; PLAN: r0=359(x), r1=215(y), r2=107(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 215
LDI r2, 107
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
