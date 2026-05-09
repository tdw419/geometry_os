; DESCRIPTION: Composite: . Then Creates a blue rectangular region at (140, 172) spanning 26 by 11 pixels. Then Places a magenta dot at position (123, 114).
; PLAN: r0=140(x), r1=172(y), r2=26(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=123(x), r1=114(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a blue rectangular region at (140, 172) spanning 26 by 11 pixels.
; PLAN: r0=140(x), r1=172(y), r2=26(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 172
LDI r2, 26
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (123, 114).
; PLAN: r0=123(x), r1=114(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 123
LDI r1, 114
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
