; DESCRIPTION: Creates a yellow rectangular region at (279, 97) spanning 98 by 91 pixels.
; PLAN: r0=279(x), r1=97(y), r2=98(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 97
LDI r2, 98
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
