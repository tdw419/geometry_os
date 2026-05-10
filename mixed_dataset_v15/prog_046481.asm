; DESCRIPTION: Composite: Places a black 75x73 rectangle at position (203, 51) then Draws a red line from (405, 109) to (342, 149).
; PLAN: r0=203(x), r1=51(y), r2=75(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=405(x1), r6=109(y1), r7=342(x2), r8=149(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 203
LDI r1, 51
LDI r2, 75
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 109
LDI r7, 342
LDI r8, 149
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
