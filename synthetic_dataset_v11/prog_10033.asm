; DESCRIPTION: Composite: . Then Creates a white rectangular region at (148, 81) spanning 68 by 20 pixels. Then Sets a single magenta pixel at (118, 229).
; PLAN: r0=148(x), r1=81(y), r2=68(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=118(x), r1=229(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a white rectangular region at (148, 81) spanning 68 by 20 pixels.
; PLAN: r0=148(x), r1=81(y), r2=68(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 81
LDI r2, 68
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (118, 229).
; PLAN: r0=118(x), r1=229(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 118
LDI r1, 229
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
