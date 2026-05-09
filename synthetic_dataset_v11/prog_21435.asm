; DESCRIPTION: Composite: . Then Creates a blue rectangular region at (156, 158) spanning 77 by 52 pixels. Then Places a yellow dot at position (87, 88).
; PLAN: r0=156(x), r1=158(y), r2=77(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=87(x), r1=88(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a blue rectangular region at (156, 158) spanning 77 by 52 pixels.
; PLAN: r0=156(x), r1=158(y), r2=77(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 158
LDI r2, 77
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (87, 88).
; PLAN: r0=87(x), r1=88(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 87
LDI r1, 88
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
