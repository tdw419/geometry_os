; DESCRIPTION: Composite: Draws a yellow rectangle at (441, 161) with width 67 and height 86 then Renders a red line between points (44, 116) and (140, 190).
; PLAN: r0=441(x), r1=161(y), r2=67(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=44(x1), r6=116(y1), r7=140(x2), r8=190(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 441
LDI r1, 161
LDI r2, 67
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 44
LDI r6, 116
LDI r7, 140
LDI r8, 190
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
