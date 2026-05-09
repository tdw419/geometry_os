; DESCRIPTION: Composite: Places a yellow 18x112 rectangle at position (354, 132) then Places a red dot at position (170, 30).
; PLAN: r0=354(x), r1=132(y), r2=18(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=170(x), r6=30(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 354
LDI r1, 132
LDI r2, 18
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 30
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
