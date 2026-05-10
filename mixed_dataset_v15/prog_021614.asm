; DESCRIPTION: Composite: Renders a yellow box of size 92x86 starting at (266, 2) then Draws a red line from (316, 65) to (345, 11).
; PLAN: r0=266(x), r1=2(y), r2=92(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=316(x1), r6=65(y1), r7=345(x2), r8=11(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 266
LDI r1, 2
LDI r2, 92
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 65
LDI r7, 345
LDI r8, 11
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
