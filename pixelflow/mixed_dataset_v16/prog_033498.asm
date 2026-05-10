; DESCRIPTION: Composite: Draws a green line from (216, 2) to (267, 169) then Renders a purple box of size 59x74 starting at (220, 81).
; PLAN: r0=216(x1), r1=2(y1), r2=267(x2), r3=169(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=220(x), r6=81(y), r7=59(width), r8=74(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 216
LDI r1, 2
LDI r2, 267
LDI r3, 169
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 81
LDI r7, 59
LDI r8, 74
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
