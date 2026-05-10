; DESCRIPTION: Composite: Places a red 77x17 rectangle at position (78, 227) then Places a purple dot at position (56, 114).
; PLAN: r0=78(x), r1=227(y), r2=77(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=56(x), r6=114(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 78
LDI r1, 227
LDI r2, 77
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 114
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
