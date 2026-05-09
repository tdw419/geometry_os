; DESCRIPTION: Composite: . Then Places a yellow dot at position (216, 39). Then Creates a purple rectangular region at (210, 227) spanning 29 by 13 pixels.
; PLAN: r0=216(x), r1=39(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=210(x), r1=227(y), r2=29(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (216, 39).
; PLAN: r0=216(x), r1=39(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 216
LDI r1, 39
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Creates a purple rectangular region at (210, 227) spanning 29 by 13 pixels.
; PLAN: r0=210(x), r1=227(y), r2=29(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 227
LDI r2, 29
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
