; DESCRIPTION: Composite: Places a magenta 21x72 rectangle at position (318, 30) then Places a red dot at position (399, 3).
; PLAN: r0=318(x), r1=30(y), r2=21(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=399(x), r6=3(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 318
LDI r1, 30
LDI r2, 21
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 3
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
