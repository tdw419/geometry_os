; DESCRIPTION: Composite: . Then Places a magenta dot at position (177, 2). Then Creates a yellow rectangular region at (158, 44) spanning 76 by 21 pixels.
; PLAN: r0=177(x), r1=2(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=158(x), r1=44(y), r2=76(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (177, 2).
; PLAN: r0=177(x), r1=2(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 177
LDI r1, 2
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a yellow rectangular region at (158, 44) spanning 76 by 21 pixels.
; PLAN: r0=158(x), r1=44(y), r2=76(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 44
LDI r2, 76
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
