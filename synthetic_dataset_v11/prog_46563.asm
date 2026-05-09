; DESCRIPTION: Composite: . Then Places a purple dot at position (205, 216). Then Creates a yellow rectangular region at (91, 54) spanning 50 by 98 pixels.
; PLAN: r0=205(x), r1=216(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=91(x), r1=54(y), r2=50(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple dot at position (205, 216).
; PLAN: r0=205(x), r1=216(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 205
LDI r1, 216
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a yellow rectangular region at (91, 54) spanning 50 by 98 pixels.
; PLAN: r0=91(x), r1=54(y), r2=50(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 54
LDI r2, 50
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
