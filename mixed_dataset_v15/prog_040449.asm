; DESCRIPTION: Composite: Renders a white box of size 51x25 starting at (94, 203) then Draws a red line from (36, 234) to (329, 102).
; PLAN: r0=94(x), r1=203(y), r2=51(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=36(x1), r6=234(y1), r7=329(x2), r8=102(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 94
LDI r1, 203
LDI r2, 51
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 234
LDI r7, 329
LDI r8, 102
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
