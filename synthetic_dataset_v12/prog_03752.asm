; DESCRIPTION: Creates a green rectangular region at (279, 2) spanning 98 by 54 pixels.
; PLAN: r0=279(x), r1=2(y), r2=98(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 2
LDI r2, 98
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
