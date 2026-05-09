; DESCRIPTION: Composite: Draws a green line from (372, 60) to (492, 92) then Places a orange circle of radius 20 at center (49, 220).
; PLAN: r0=372(x1), r1=60(y1), r2=492(x2), r3=92(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=49(x), r6=220(y), r7=20(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 372
LDI r1, 60
LDI r2, 492
LDI r3, 92
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 220
LDI r7, 20
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
