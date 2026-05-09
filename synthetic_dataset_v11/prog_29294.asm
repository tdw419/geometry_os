; DESCRIPTION: Composite: . Then Creates a purple rectangular region at (110, 83) spanning 108 by 89 pixels. Then Places a purple dot at position (253, 182).
; PLAN: r0=110(x), r1=83(y), r2=108(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=253(x), r1=182(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a purple rectangular region at (110, 83) spanning 108 by 89 pixels.
; PLAN: r0=110(x), r1=83(y), r2=108(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 83
LDI r2, 108
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (253, 182).
; PLAN: r0=253(x), r1=182(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 253
LDI r1, 182
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
