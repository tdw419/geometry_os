; DESCRIPTION: Creates a green rectangular region at (20, 27) spanning 20 by 107 pixels.
; PLAN: r0=20(x), r1=27(y), r2=20(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 27
LDI r2, 20
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
