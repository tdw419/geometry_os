; DESCRIPTION: Composite: Draws a black line from (146, 91) to (123, 203) then Places a green circle of radius 53 at center (397, 149).
; PLAN: r0=146(x1), r1=91(y1), r2=123(x2), r3=203(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=397(x), r6=149(y), r7=53(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 146
LDI r1, 91
LDI r2, 123
LDI r3, 203
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 149
LDI r7, 53
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
