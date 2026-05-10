; DESCRIPTION: Composite: Places a black 117x28 rectangle at position (176, 94) then Places a white line segment connecting (453, 177) to (338, 203).
; PLAN: r0=176(x), r1=94(y), r2=117(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=453(x1), r6=177(y1), r7=338(x2), r8=203(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 176
LDI r1, 94
LDI r2, 117
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 177
LDI r7, 338
LDI r8, 203
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
