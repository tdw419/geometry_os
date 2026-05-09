; DESCRIPTION: Creates a green rectangular region at (164, 71) spanning 62 by 98 pixels.
; PLAN: r0=164(x), r1=71(y), r2=62(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 71
LDI r2, 62
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
