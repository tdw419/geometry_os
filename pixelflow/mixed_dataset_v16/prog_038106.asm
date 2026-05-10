; DESCRIPTION: Composite: Places a green 73x60 rectangle at position (167, 153) then Sets a single black pixel at (3, 81).
; PLAN: r0=167(x), r1=153(y), r2=73(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=3(x), r6=81(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 167
LDI r1, 153
LDI r2, 73
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 3
LDI r6, 81
LDI r7, 0x000000
PSET r5, r6, r7
HALT
