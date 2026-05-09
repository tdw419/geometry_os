; DESCRIPTION: Composite: Draws a red line from (214, 241) to (361, 221) then Draws a magenta rectangle at (114, 131) with width 10 and height 110.
; PLAN: r0=214(x1), r1=241(y1), r2=361(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=114(x), r6=131(y), r7=10(width), r8=110(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 214
LDI r1, 241
LDI r2, 361
LDI r3, 221
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 131
LDI r7, 10
LDI r8, 110
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
