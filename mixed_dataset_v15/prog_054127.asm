; DESCRIPTION: Composite: Renders a white box of size 103x101 starting at (55, 91) then Places a black line segment connecting (195, 139) to (454, 220).
; PLAN: r0=55(x), r1=91(y), r2=103(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=195(x1), r6=139(y1), r7=454(x2), r8=220(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 55
LDI r1, 91
LDI r2, 103
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 139
LDI r7, 454
LDI r8, 220
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
