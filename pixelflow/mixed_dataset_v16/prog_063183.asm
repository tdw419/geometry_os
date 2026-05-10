; DESCRIPTION: Composite: Places a green circle of radius 28 at center (326, 226) then Places a green line segment connecting (45, 167) to (59, 17).
; PLAN: r0=326(x), r1=226(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=45(x1), r6=167(y1), r7=59(x2), r8=17(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 326
LDI r1, 226
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 45
LDI r6, 167
LDI r7, 59
LDI r8, 17
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
