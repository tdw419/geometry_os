; DESCRIPTION: Composite: Places a cyan 98x90 rectangle at position (115, 97) then Creates a green circular shape at (423, 92) with radius 44.
; PLAN: r0=115(x), r1=97(y), r2=98(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=423(x), r6=92(y), r7=44(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 115
LDI r1, 97
LDI r2, 98
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 92
LDI r7, 44
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
