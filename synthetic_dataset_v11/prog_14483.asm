; DESCRIPTION: Composite: . Then Renders a black box of size 44x90 starting at (104, 58). Then Places a white line segment connecting (159, 4) to (189, 90).
; PLAN: r0=104(x), r1=58(y), r2=44(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=159(x1), r1=4(y1), r2=189(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black box of size 44x90 starting at (104, 58).
; PLAN: r0=104(x), r1=58(y), r2=44(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 58
LDI r2, 44
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white line segment connecting (159, 4) to (189, 90).
; PLAN: r0=159(x1), r1=4(y1), r2=189(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 4
LDI r2, 189
LDI r3, 90
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
