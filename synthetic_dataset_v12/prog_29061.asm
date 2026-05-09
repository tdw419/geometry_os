; DESCRIPTION: Composite: Draws a yellow rectangle at (242, 93) with width 93 and height 15 then Places a purple line segment connecting (103, 230) to (365, 123).
; PLAN: r0=242(x), r1=93(y), r2=93(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=103(x1), r6=230(y1), r7=365(x2), r8=123(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 242
LDI r1, 93
LDI r2, 93
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 230
LDI r7, 365
LDI r8, 123
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
