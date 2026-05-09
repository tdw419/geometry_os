; DESCRIPTION: Composite: Places a yellow line segment connecting (287, 195) to (256, 248) then Places a red circle of radius 60 at center (146, 70).
; PLAN: r0=287(x1), r1=195(y1), r2=256(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=146(x), r6=70(y), r7=60(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 287
LDI r1, 195
LDI r2, 256
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 146
LDI r6, 70
LDI r7, 60
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
