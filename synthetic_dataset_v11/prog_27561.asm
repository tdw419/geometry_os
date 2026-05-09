; DESCRIPTION: Composite: . Then Creates a yellow rectangular region at (130, 54) spanning 58 by 101 pixels. Then Places a purple dot at position (242, 147).
; PLAN: r0=130(x), r1=54(y), r2=58(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=242(x), r1=147(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a yellow rectangular region at (130, 54) spanning 58 by 101 pixels.
; PLAN: r0=130(x), r1=54(y), r2=58(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 54
LDI r2, 58
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (242, 147).
; PLAN: r0=242(x), r1=147(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 242
LDI r1, 147
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
