; DESCRIPTION: Creates a green rectangular region at (24, 126) spanning 37 by 98 pixels.
; PLAN: r0=24(x), r1=126(y), r2=37(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 126
LDI r2, 37
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
