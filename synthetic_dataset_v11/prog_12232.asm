; DESCRIPTION: Composite: . Then Creates a blue rectangular region at (55, 126) spanning 93 by 23 pixels. Then Sets a single red pixel at (184, 9).
; PLAN: r0=55(x), r1=126(y), r2=93(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=184(x), r1=9(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a blue rectangular region at (55, 126) spanning 93 by 23 pixels.
; PLAN: r0=55(x), r1=126(y), r2=93(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 126
LDI r2, 93
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (184, 9).
; PLAN: r0=184(x), r1=9(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 184
LDI r1, 9
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
