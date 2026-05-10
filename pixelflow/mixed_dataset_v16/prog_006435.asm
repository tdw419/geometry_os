; DESCRIPTION: Composite: Draws a red line from (111, 221) to (312, 50) then Places a black 70x110 rectangle at position (121, 130).
; PLAN: r0=111(x1), r1=221(y1), r2=312(x2), r3=50(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=121(x), r6=130(y), r7=70(width), r8=110(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 111
LDI r1, 221
LDI r2, 312
LDI r3, 50
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 130
LDI r7, 70
LDI r8, 110
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
