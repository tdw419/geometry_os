; DESCRIPTION: Composite: Draws a blue line from (125, 62) to (48, 155) then Places a orange circle of radius 19 at center (488, 170).
; PLAN: r0=125(x1), r1=62(y1), r2=48(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=488(x), r6=170(y), r7=19(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 125
LDI r1, 62
LDI r2, 48
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 488
LDI r6, 170
LDI r7, 19
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
