; DESCRIPTION: Composite: Places a blue line segment connecting (457, 220) to (168, 201) then Renders a yellow box of size 64x35 starting at (20, 177).
; PLAN: r0=457(x1), r1=220(y1), r2=168(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=20(x), r6=177(y), r7=64(width), r8=35(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 457
LDI r1, 220
LDI r2, 168
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 177
LDI r7, 64
LDI r8, 35
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
