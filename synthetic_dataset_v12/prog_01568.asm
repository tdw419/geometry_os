; DESCRIPTION: Composite: Draws a yellow circle centered at (293, 157) with radius 67 then Draws a red line from (465, 93) to (136, 71).
; PLAN: r0=293(x), r1=157(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=465(x1), r6=93(y1), r7=136(x2), r8=71(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 293
LDI r1, 157
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 465
LDI r6, 93
LDI r7, 136
LDI r8, 71
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
