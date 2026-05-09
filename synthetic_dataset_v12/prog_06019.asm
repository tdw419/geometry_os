; DESCRIPTION: Composite: Renders a cyan box of size 80x32 starting at (16, 216) then Draws a blue line from (125, 217) to (378, 221).
; PLAN: r0=16(x), r1=216(y), r2=80(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=125(x1), r6=217(y1), r7=378(x2), r8=221(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 16
LDI r1, 216
LDI r2, 80
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 217
LDI r7, 378
LDI r8, 221
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
