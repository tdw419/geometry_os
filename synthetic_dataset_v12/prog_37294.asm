; DESCRIPTION: Composite: Renders a white line between points (83, 172) and (67, 204) then Sets a single yellow pixel at (362, 18) then Places a blue 36x44 rectangle at position (176, 11).
; PLAN: r0=83(x1), r1=172(y1), r2=67(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=362(x), r6=18(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=176(x), r11=11(y), r12=36(width), r13=44(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 83
LDI r1, 172
LDI r2, 67
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 18
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 176
LDI r11, 11
LDI r12, 36
LDI r13, 44
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
