; DESCRIPTION: Composite: Places a purple line segment connecting (386, 171) to (378, 49) then Places a blue 117x18 rectangle at position (386, 69).
; PLAN: r0=386(x1), r1=171(y1), r2=378(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=386(x), r6=69(y), r7=117(width), r8=18(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 386
LDI r1, 171
LDI r2, 378
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 69
LDI r7, 117
LDI r8, 18
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
