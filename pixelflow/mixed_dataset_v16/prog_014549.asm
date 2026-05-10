; DESCRIPTION: Composite: Places a blue dot at position (491, 19) then Places a blue 30x25 rectangle at position (326, 195) then Places a magenta line segment connecting (71, 47) to (148, 72).
; PLAN: r0=491(x), r1=19(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=326(x), r6=195(y), r7=30(width), r8=25(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=71(x1), r11=47(y1), r12=148(x2), r13=72(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 491
LDI r1, 19
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 326
LDI r6, 195
LDI r7, 30
LDI r8, 25
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 71
LDI r11, 47
LDI r12, 148
LDI r13, 72
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
