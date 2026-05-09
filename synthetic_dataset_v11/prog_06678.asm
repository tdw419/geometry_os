; DESCRIPTION: Creates a green rectangular region at (99, 177) spanning 98 by 28 pixels.
; PLAN: r0=99(x), r1=177(y), r2=98(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 177
LDI r2, 98
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
