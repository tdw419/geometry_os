; DESCRIPTION: Composite: Places a orange dot at position (60, 74) then Places a magenta line segment connecting (54, 220) to (419, 221) then Places a magenta circle of radius 25 at center (370, 133).
; PLAN: r0=60(x), r1=74(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=54(x1), r6=220(y1), r7=419(x2), r8=221(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=370(x), r11=133(y), r12=25(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 60
LDI r1, 74
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 54
LDI r6, 220
LDI r7, 419
LDI r8, 221
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 370
LDI r11, 133
LDI r12, 25
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
