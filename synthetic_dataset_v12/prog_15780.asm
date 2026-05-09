; DESCRIPTION: Composite: Draws a magenta line from (233, 216) to (269, 8) then Places a yellow circle of radius 28 at center (328, 176).
; PLAN: r0=233(x1), r1=216(y1), r2=269(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=328(x), r6=176(y), r7=28(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 233
LDI r1, 216
LDI r2, 269
LDI r3, 8
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 176
LDI r7, 28
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
