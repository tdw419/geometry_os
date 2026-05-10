; DESCRIPTION: Composite: Draws a blue line from (46, 70) to (205, 196) then Places a black circle of radius 41 at center (55, 44).
; PLAN: r0=46(x1), r1=70(y1), r2=205(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=55(x), r6=44(y), r7=41(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 46
LDI r1, 70
LDI r2, 205
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 55
LDI r6, 44
LDI r7, 41
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
