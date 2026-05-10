; DESCRIPTION: Composite: Draws a cyan circle centered at (294, 144) with radius 49 then Places a purple line segment connecting (273, 74) to (502, 240).
; PLAN: r0=294(x), r1=144(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=273(x1), r6=74(y1), r7=502(x2), r8=240(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 294
LDI r1, 144
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 273
LDI r6, 74
LDI r7, 502
LDI r8, 240
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
