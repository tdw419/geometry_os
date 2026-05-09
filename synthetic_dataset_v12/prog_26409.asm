; DESCRIPTION: Composite: Places a blue 113x98 rectangle at position (155, 0) then Places a red dot at position (47, 191).
; PLAN: r0=155(x), r1=0(y), r2=113(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=47(x), r6=191(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 155
LDI r1, 0
LDI r2, 113
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 47
LDI r6, 191
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
