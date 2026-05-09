; DESCRIPTION: Composite: Draws a green line from (57, 54) to (498, 106) then Renders a yellow box of size 66x93 starting at (65, 11).
; PLAN: r0=57(x1), r1=54(y1), r2=498(x2), r3=106(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=65(x), r6=11(y), r7=66(width), r8=93(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 57
LDI r1, 54
LDI r2, 498
LDI r3, 106
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 11
LDI r7, 66
LDI r8, 93
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
