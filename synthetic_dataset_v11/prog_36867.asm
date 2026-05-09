; DESCRIPTION: Composite: . Then Creates a yellow rectangular region at (134, 23) spanning 18 by 68 pixels. Then Places a magenta dot at position (178, 142).
; PLAN: r0=134(x), r1=23(y), r2=18(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=178(x), r1=142(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a yellow rectangular region at (134, 23) spanning 18 by 68 pixels.
; PLAN: r0=134(x), r1=23(y), r2=18(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 23
LDI r2, 18
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (178, 142).
; PLAN: r0=178(x), r1=142(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 178
LDI r1, 142
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
