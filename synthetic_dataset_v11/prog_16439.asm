; DESCRIPTION: Composite: . Then Creates a black rectangular region at (31, 8) spanning 113 by 65 pixels. Then Places a magenta dot at position (84, 114).
; PLAN: r0=31(x), r1=8(y), r2=113(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=84(x), r1=114(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a black rectangular region at (31, 8) spanning 113 by 65 pixels.
; PLAN: r0=31(x), r1=8(y), r2=113(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 8
LDI r2, 113
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (84, 114).
; PLAN: r0=84(x), r1=114(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 84
LDI r1, 114
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
