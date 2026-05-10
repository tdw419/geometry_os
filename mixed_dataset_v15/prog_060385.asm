; DESCRIPTION: Composite: Draws a white line from (98, 69) to (359, 84) then Places a magenta circle of radius 30 at center (270, 150).
; PLAN: r0=98(x1), r1=69(y1), r2=359(x2), r3=84(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=270(x), r6=150(y), r7=30(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 98
LDI r1, 69
LDI r2, 359
LDI r3, 84
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 150
LDI r7, 30
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
