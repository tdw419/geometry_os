; DESCRIPTION: Composite: Places a white line segment connecting (446, 201) to (486, 24) then Renders a orange box of size 36x104 starting at (206, 140).
; PLAN: r0=446(x1), r1=201(y1), r2=486(x2), r3=24(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=206(x), r6=140(y), r7=36(width), r8=104(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 446
LDI r1, 201
LDI r2, 486
LDI r3, 24
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 140
LDI r7, 36
LDI r8, 104
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
