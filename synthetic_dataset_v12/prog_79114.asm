; DESCRIPTION: Composite: Places a white line segment connecting (125, 21) to (267, 145) then Places a white 105x104 rectangle at position (258, 148).
; PLAN: r0=125(x1), r1=21(y1), r2=267(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=258(x), r6=148(y), r7=105(width), r8=104(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 125
LDI r1, 21
LDI r2, 267
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 148
LDI r7, 105
LDI r8, 104
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
