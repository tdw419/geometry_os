; DESCRIPTION: Composite: . Then Places a magenta dot at position (209, 182). Then Creates a yellow rectangular region at (62, 147) spanning 118 by 80 pixels.
; PLAN: r0=209(x), r1=182(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=62(x), r1=147(y), r2=118(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (209, 182).
; PLAN: r0=209(x), r1=182(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 209
LDI r1, 182
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a yellow rectangular region at (62, 147) spanning 118 by 80 pixels.
; PLAN: r0=62(x), r1=147(y), r2=118(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 147
LDI r2, 118
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
