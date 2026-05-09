; DESCRIPTION: Composite: Renders a white line between points (411, 113) and (345, 13) then Places a green circle of radius 46 at center (270, 121).
; PLAN: r0=411(x1), r1=113(y1), r2=345(x2), r3=13(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=270(x), r6=121(y), r7=46(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 411
LDI r1, 113
LDI r2, 345
LDI r3, 13
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 121
LDI r7, 46
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
