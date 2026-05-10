; DESCRIPTION: Composite: Places a black dot at position (164, 117) then Places a magenta 89x111 rectangle at position (109, 108) then Places a magenta line segment connecting (383, 131) to (203, 72).
; PLAN: r0=164(x), r1=117(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=109(x), r6=108(y), r7=89(width), r8=111(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=383(x1), r11=131(y1), r12=203(x2), r13=72(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 164
LDI r1, 117
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 109
LDI r6, 108
LDI r7, 89
LDI r8, 111
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 383
LDI r11, 131
LDI r12, 203
LDI r13, 72
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
