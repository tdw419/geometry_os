; DESCRIPTION: Composite: Places a orange circle of radius 53 at center (184, 200) then Draws a blue line from (132, 42) to (455, 0).
; PLAN: r0=184(x), r1=200(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x1), r6=42(y1), r7=455(x2), r8=0(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 184
LDI r1, 200
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 42
LDI r7, 455
LDI r8, 0
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
