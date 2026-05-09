; DESCRIPTION: Composite: . Then Creates a red rectangular region at (201, 27) spanning 52 by 46 pixels. Then Places a blue dot at position (20, 71).
; PLAN: r0=201(x), r1=27(y), r2=52(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=20(x), r1=71(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a red rectangular region at (201, 27) spanning 52 by 46 pixels.
; PLAN: r0=201(x), r1=27(y), r2=52(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 27
LDI r2, 52
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (20, 71).
; PLAN: r0=20(x), r1=71(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 20
LDI r1, 71
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
