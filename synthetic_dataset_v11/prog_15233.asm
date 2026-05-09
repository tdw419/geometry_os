; DESCRIPTION: Composite: . Then Sets a single black pixel at (25, 188). Then Creates a blue rectangular region at (169, 118) spanning 21 by 20 pixels.
; PLAN: r0=25(x), r1=188(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=169(x), r1=118(y), r2=21(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (25, 188).
; PLAN: r0=25(x), r1=188(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 25
LDI r1, 188
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Creates a blue rectangular region at (169, 118) spanning 21 by 20 pixels.
; PLAN: r0=169(x), r1=118(y), r2=21(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 118
LDI r2, 21
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
