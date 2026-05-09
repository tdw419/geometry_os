; DESCRIPTION: Composite: Creates a black circular shape at (133, 105) with radius 64 then Draws a blue line from (479, 18) to (456, 243).
; PLAN: r0=133(x), r1=105(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=479(x1), r6=18(y1), r7=456(x2), r8=243(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 133
LDI r1, 105
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 479
LDI r6, 18
LDI r7, 456
LDI r8, 243
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
