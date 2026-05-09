; DESCRIPTION: Composite: Renders a purple line between points (356, 39) and (30, 254) then Places a green circle of radius 64 at center (405, 101).
; PLAN: r0=356(x1), r1=39(y1), r2=30(x2), r3=254(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=405(x), r6=101(y), r7=64(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 356
LDI r1, 39
LDI r2, 30
LDI r3, 254
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 101
LDI r7, 64
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
