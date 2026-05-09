; DESCRIPTION: Composite: . Then Places a white dot at position (13, 10). Then Creates a purple rectangular region at (77, 9) spanning 94 by 113 pixels.
; PLAN: r0=13(x), r1=10(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=77(x), r1=9(y), r2=94(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (13, 10).
; PLAN: r0=13(x), r1=10(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 13
LDI r1, 10
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a purple rectangular region at (77, 9) spanning 94 by 113 pixels.
; PLAN: r0=77(x), r1=9(y), r2=94(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 9
LDI r2, 94
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
