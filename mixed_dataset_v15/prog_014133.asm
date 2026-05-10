; DESCRIPTION: Composite: Sets a single cyan pixel at (423, 131) then Creates a white rectangular region at (284, 98) spanning 53 by 117 pixels then Places a red line segment connecting (409, 200) to (159, 166).
; PLAN: r0=423(x), r1=131(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=284(x), r6=98(y), r7=53(width), r8=117(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=409(x1), r11=200(y1), r12=159(x2), r13=166(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 423
LDI r1, 131
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 284
LDI r6, 98
LDI r7, 53
LDI r8, 117
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 409
LDI r11, 200
LDI r12, 159
LDI r13, 166
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
