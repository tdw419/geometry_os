; DESCRIPTION: Composite: Places a cyan line segment connecting (307, 185) to (137, 168) then Renders a purple disk with center (340, 99) and radius 50.
; PLAN: r0=307(x1), r1=185(y1), r2=137(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=340(x), r6=99(y), r7=50(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 307
LDI r1, 185
LDI r2, 137
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 99
LDI r7, 50
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
