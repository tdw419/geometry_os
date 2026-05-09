; DESCRIPTION: Composite: . Then Creates a blue rectangular region at (179, 170) spanning 67 by 57 pixels. Then Places a purple dot at position (233, 212).
; PLAN: r0=179(x), r1=170(y), r2=67(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=233(x), r1=212(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a blue rectangular region at (179, 170) spanning 67 by 57 pixels.
; PLAN: r0=179(x), r1=170(y), r2=67(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 170
LDI r2, 67
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (233, 212).
; PLAN: r0=233(x), r1=212(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 233
LDI r1, 212
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
