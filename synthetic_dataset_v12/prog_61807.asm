; DESCRIPTION: Composite: Draws a yellow line from (182, 182) to (44, 44) then Renders a yellow box of size 95x77 starting at (280, 12).
; PLAN: r0=182(x1), r1=182(y1), r2=44(x2), r3=44(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=280(x), r6=12(y), r7=95(width), r8=77(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 182
LDI r1, 182
LDI r2, 44
LDI r3, 44
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 12
LDI r7, 95
LDI r8, 77
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
