; DESCRIPTION: Composite: Sets a single magenta pixel at (229, 148) then Creates a red rectangular region at (205, 215) spanning 24 by 40 pixels.
; PLAN: r0=229(x), r1=148(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=205(x), r6=215(y), r7=24(width), r8=40(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 229
LDI r1, 148
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 205
LDI r6, 215
LDI r7, 24
LDI r8, 40
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
