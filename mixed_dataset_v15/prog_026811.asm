; DESCRIPTION: Composite: Places a green 56x118 rectangle at position (16, 60) then Places a black dot at position (58, 239).
; PLAN: r0=16(x), r1=60(y), r2=56(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=58(x), r6=239(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 16
LDI r1, 60
LDI r2, 56
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 58
LDI r6, 239
LDI r7, 0x000000
PSET r5, r6, r7
HALT
