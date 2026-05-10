; DESCRIPTION: Composite: Renders a black box of size 98x84 starting at (35, 74) then Draws a magenta line from (16, 216) to (232, 88).
; PLAN: r0=35(x), r1=74(y), r2=98(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=16(x1), r6=216(y1), r7=232(x2), r8=88(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 35
LDI r1, 74
LDI r2, 98
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 16
LDI r6, 216
LDI r7, 232
LDI r8, 88
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
