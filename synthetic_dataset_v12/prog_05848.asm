; DESCRIPTION: Composite: Places a cyan line segment connecting (486, 31) to (69, 191) then Draws a red rectangle at (220, 162) with width 99 and height 80.
; PLAN: r0=486(x1), r1=31(y1), r2=69(x2), r3=191(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=220(x), r6=162(y), r7=99(width), r8=80(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 486
LDI r1, 31
LDI r2, 69
LDI r3, 191
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 162
LDI r7, 99
LDI r8, 80
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
