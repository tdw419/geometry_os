; DESCRIPTION: Composite: Renders a white line between points (408, 197) and (89, 123) then Renders a white box of size 104x98 starting at (59, 85).
; PLAN: r0=408(x1), r1=197(y1), r2=89(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=59(x), r6=85(y), r7=104(width), r8=98(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 408
LDI r1, 197
LDI r2, 89
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 85
LDI r7, 104
LDI r8, 98
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
