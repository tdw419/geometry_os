; DESCRIPTION: Composite: . Then Creates a blue rectangular region at (145, 119) spanning 37 by 69 pixels. Then Sets a single red pixel at (165, 198).
; PLAN: r0=145(x), r1=119(y), r2=37(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=165(x), r1=198(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a blue rectangular region at (145, 119) spanning 37 by 69 pixels.
; PLAN: r0=145(x), r1=119(y), r2=37(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 119
LDI r2, 37
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (165, 198).
; PLAN: r0=165(x), r1=198(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 165
LDI r1, 198
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
