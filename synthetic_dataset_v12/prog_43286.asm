; DESCRIPTION: Composite: Renders a red box of size 115x94 starting at (291, 116) then Draws a magenta line from (174, 182) to (244, 7).
; PLAN: r0=291(x), r1=116(y), r2=115(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=174(x1), r6=182(y1), r7=244(x2), r8=7(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 291
LDI r1, 116
LDI r2, 115
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 182
LDI r7, 244
LDI r8, 7
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
