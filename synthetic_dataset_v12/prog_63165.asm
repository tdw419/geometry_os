; DESCRIPTION: Composite: Places a yellow line segment connecting (254, 69) to (423, 103) then Places a yellow 78x28 rectangle at position (133, 2).
; PLAN: r0=254(x1), r1=69(y1), r2=423(x2), r3=103(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=133(x), r6=2(y), r7=78(width), r8=28(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 254
LDI r1, 69
LDI r2, 423
LDI r3, 103
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 2
LDI r7, 78
LDI r8, 28
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
