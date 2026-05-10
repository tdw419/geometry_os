; DESCRIPTION: Composite: Sets a single purple pixel at (112, 117) then Creates a red rectangular region at (126, 57) spanning 40 by 88 pixels.
; PLAN: r0=112(x), r1=117(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=126(x), r6=57(y), r7=40(width), r8=88(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 112
LDI r1, 117
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 126
LDI r6, 57
LDI r7, 40
LDI r8, 88
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
