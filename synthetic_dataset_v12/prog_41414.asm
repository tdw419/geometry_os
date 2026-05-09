; DESCRIPTION: Composite: Places a purple line segment connecting (240, 149) to (345, 128) then Places a purple circle of radius 22 at center (346, 139).
; PLAN: r0=240(x1), r1=149(y1), r2=345(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=346(x), r6=139(y), r7=22(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 240
LDI r1, 149
LDI r2, 345
LDI r3, 128
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 139
LDI r7, 22
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
