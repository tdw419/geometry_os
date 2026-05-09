; DESCRIPTION: Composite: Draws a magenta line from (412, 221) to (398, 200) then Creates a yellow circular shape at (459, 65) with radius 52.
; PLAN: r0=412(x1), r1=221(y1), r2=398(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=459(x), r6=65(y), r7=52(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 412
LDI r1, 221
LDI r2, 398
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 459
LDI r6, 65
LDI r7, 52
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
