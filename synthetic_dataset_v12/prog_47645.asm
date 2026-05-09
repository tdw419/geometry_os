; DESCRIPTION: Composite: Places a red dot at position (3, 217) then Places a black 24x120 rectangle at position (6, 63).
; PLAN: r0=3(x), r1=217(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=6(x), r6=63(y), r7=24(width), r8=120(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 3
LDI r1, 217
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 6
LDI r6, 63
LDI r7, 24
LDI r8, 120
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
