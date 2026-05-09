; DESCRIPTION: Composite: Draws a blue line from (240, 66) to (292, 32) then Places a black circle of radius 18 at center (24, 52).
; PLAN: r0=240(x1), r1=66(y1), r2=292(x2), r3=32(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=24(x), r6=52(y), r7=18(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 240
LDI r1, 66
LDI r2, 292
LDI r3, 32
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 52
LDI r7, 18
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
