; DESCRIPTION: Composite: . Then Places a cyan dot at position (167, 10). Then Creates a blue rectangular region at (200, 52) spanning 21 by 71 pixels.
; PLAN: r0=167(x), r1=10(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=200(x), r1=52(y), r2=21(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (167, 10).
; PLAN: r0=167(x), r1=10(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 167
LDI r1, 10
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a blue rectangular region at (200, 52) spanning 21 by 71 pixels.
; PLAN: r0=200(x), r1=52(y), r2=21(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 52
LDI r2, 21
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
