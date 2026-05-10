; DESCRIPTION: Composite: Draws a cyan rectangle at (104, 69) with width 89 and height 56 then Places a green dot at position (506, 207).
; PLAN: r0=104(x), r1=69(y), r2=89(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=506(x), r6=207(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 104
LDI r1, 69
LDI r2, 89
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 506
LDI r6, 207
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
