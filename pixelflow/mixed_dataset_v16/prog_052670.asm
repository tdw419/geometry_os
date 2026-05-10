; DESCRIPTION: Composite: Places a blue circle of radius 56 at center (405, 111) then Places a red line segment connecting (274, 84) to (362, 128).
; PLAN: r0=405(x), r1=111(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=274(x1), r6=84(y1), r7=362(x2), r8=128(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 405
LDI r1, 111
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 274
LDI r6, 84
LDI r7, 362
LDI r8, 128
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
