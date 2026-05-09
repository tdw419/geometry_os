; DESCRIPTION: Composite: . Then Places a green dot at position (183, 74). Then Creates a blue rectangular region at (110, 74) spanning 102 by 81 pixels.
; PLAN: r0=183(x), r1=74(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=110(x), r1=74(y), r2=102(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (183, 74).
; PLAN: r0=183(x), r1=74(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 183
LDI r1, 74
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Creates a blue rectangular region at (110, 74) spanning 102 by 81 pixels.
; PLAN: r0=110(x), r1=74(y), r2=102(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 74
LDI r2, 102
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
