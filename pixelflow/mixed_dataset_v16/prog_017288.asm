; DESCRIPTION: Composite: Draws a magenta circle centered at (87, 123) with radius 65 then Places a cyan line segment connecting (425, 220) to (18, 216).
; PLAN: r0=87(x), r1=123(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=425(x1), r6=220(y1), r7=18(x2), r8=216(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 87
LDI r1, 123
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 425
LDI r6, 220
LDI r7, 18
LDI r8, 216
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
