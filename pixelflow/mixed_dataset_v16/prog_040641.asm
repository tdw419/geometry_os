; DESCRIPTION: Composite: Draws a cyan circle centered at (113, 135) with radius 29 then Places a black line segment connecting (472, 187) to (284, 67).
; PLAN: r0=113(x), r1=135(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=472(x1), r6=187(y1), r7=284(x2), r8=67(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 113
LDI r1, 135
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 472
LDI r6, 187
LDI r7, 284
LDI r8, 67
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
