; DESCRIPTION: Composite: . Then Sets a single purple pixel at (128, 124). Then Draws a red rectangle at (152, 44) with width 99 and height 89.
; PLAN: r0=128(x), r1=124(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=152(x), r1=44(y), r2=99(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (128, 124).
; PLAN: r0=128(x), r1=124(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 128
LDI r1, 124
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a red rectangle at (152, 44) with width 99 and height 89.
; PLAN: r0=152(x), r1=44(y), r2=99(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 44
LDI r2, 99
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
