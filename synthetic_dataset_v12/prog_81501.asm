; DESCRIPTION: Composite: Places a magenta dot at position (293, 40) then Creates a red rectangular region at (88, 150) spanning 94 by 15 pixels.
; PLAN: r0=293(x), r1=40(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=88(x), r6=150(y), r7=94(width), r8=15(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 293
LDI r1, 40
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 88
LDI r6, 150
LDI r7, 94
LDI r8, 15
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
