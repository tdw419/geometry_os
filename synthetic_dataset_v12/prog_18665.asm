; DESCRIPTION: Composite: Renders a blue line between points (198, 188) and (115, 63) then Creates a cyan circular shape at (70, 180) with radius 10.
; PLAN: r0=198(x1), r1=188(y1), r2=115(x2), r3=63(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=70(x), r6=180(y), r7=10(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 198
LDI r1, 188
LDI r2, 115
LDI r3, 63
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 70
LDI r6, 180
LDI r7, 10
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
