; DESCRIPTION: Composite: Draws a blue rectangle at (260, 104) with width 117 and height 47 then Places a green dot at position (215, 182).
; PLAN: r0=260(x), r1=104(y), r2=117(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=215(x), r6=182(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 260
LDI r1, 104
LDI r2, 117
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 182
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
