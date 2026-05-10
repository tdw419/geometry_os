; DESCRIPTION: Composite: Places a red 51x118 rectangle at position (407, 96) then Places a cyan line segment connecting (14, 14) to (475, 15).
; PLAN: r0=407(x), r1=96(y), r2=51(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=14(x1), r6=14(y1), r7=475(x2), r8=15(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 407
LDI r1, 96
LDI r2, 51
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 14
LDI r6, 14
LDI r7, 475
LDI r8, 15
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
