; DESCRIPTION: Composite: Draws a red line from (3, 234) to (106, 223) then Renders a blue box of size 31x115 starting at (130, 53).
; PLAN: r0=3(x1), r1=234(y1), r2=106(x2), r3=223(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=130(x), r6=53(y), r7=31(width), r8=115(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 3
LDI r1, 234
LDI r2, 106
LDI r3, 223
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 53
LDI r7, 31
LDI r8, 115
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
