; DESCRIPTION: Composite: Places a orange circle of radius 75 at center (425, 120) then Places a purple line segment connecting (436, 213) to (288, 6).
; PLAN: r0=425(x), r1=120(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=436(x1), r6=213(y1), r7=288(x2), r8=6(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 425
LDI r1, 120
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 436
LDI r6, 213
LDI r7, 288
LDI r8, 6
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
