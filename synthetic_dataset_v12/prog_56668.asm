; DESCRIPTION: Composite: Places a cyan dot at position (375, 139) then Places a green line segment connecting (464, 91) to (500, 153) then Renders a purple box of size 74x74 starting at (98, 31).
; PLAN: r0=375(x), r1=139(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=464(x1), r6=91(y1), r7=500(x2), r8=153(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=98(x), r11=31(y), r12=74(width), r13=74(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 375
LDI r1, 139
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 464
LDI r6, 91
LDI r7, 500
LDI r8, 153
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 98
LDI r11, 31
LDI r12, 74
LDI r13, 74
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
